import SwiftUI
import CoreML

class InspectorViewModel: ObservableObject {
    
    // Feature 1: Length
    func findLength(payload: String) -> Int {
        return payload.count
    }
    
    // Feature 2: Number of non-printable characters
    func findNonPrintChars(payload: String) -> Int {
        var nonPrintableCharacters: [Character] = []
        for scalar in payload.unicodeScalars {
            // Check if the scalar value is outside the range of printable characters
            if scalar.value < 32 || scalar.value > 126 {
                nonPrintableCharacters.append(Character(scalar))
            }
        }
        return nonPrintableCharacters.count
    }
    
    // Feature 3: Number of special characters
    func findPunctuationChars(payload: String) -> Int {
        let punctuationCharacterSet = CharacterSet.punctuationCharacters
        var count = 0
        for scalar in payload.unicodeScalars {
            let character = Character(scalar)
            if punctuationCharacterSet.contains(character.unicodeScalars.first!) {
                count += 1
            }
        }
        return count
    }
    
    // Feature 4: Number of SQL Keywords
    func findSqlKeys(payload: String) -> Int {
        var count = 0
        for item in Constants.Keywords.sqlKeys {
            if payload.lowercased().contains(item.lowercased()) {
                count += 1
            }
        }
        return count
    }
    
    // Feature 5: Number of JS Keywords
    func findJsKeys(payload: String) -> Int {
        var count = 0
        for item in Constants.Keywords.jsKeys {
            if payload.lowercased().contains(item.lowercased()) {
                count += 1
            }
        }
        return count
    }
    
    // Feature 6: Number of Command Keywords
    func findCmdKeys(payload: String) -> Int {
        var count = 0
        for item in Constants.Keywords.cmdKeys {
            if payload.lowercased().contains(item.lowercased()) {
                count += 1
            }
        }
        return count
    }
    
    // SANITIZE
    
    // Filter punctuation characters
    func removePunctuationChars(input: String) -> String {
        let punctuationSet = CharacterSet.punctuationCharacters
        let components = input.components(separatedBy: punctuationSet)
        let result = components.joined()
        return result
    }
    
    // Filter non-printable characters
    func removeNonPrintChars(input: String) -> String {
        var filteredString = ""
        for character in input {
            let unicodeScalarValue = character.unicodeScalars.first!.value
            if (unicodeScalarValue >= 32 && unicodeScalarValue <= 126) {
                filteredString.append(character)
            }
        }
        return filteredString
    }
    
    // Filter punctuation characters
    func removeSpecialChars(input: String) -> String {
        let allowedCharacterSet = CharacterSet.alphanumerics
        let filteredString = input.components(separatedBy: allowedCharacterSet.inverted).joined()
        return filteredString
    }
    
    // Filter numeric characters
    func removeNumericCharacters(input: String) -> String {
        let numericCharacterSet = CharacterSet(charactersIn: "0123456789")
        let filteredString = input.components(separatedBy: numericCharacterSet).joined()
        return filteredString
    }
    
    
    func sanitize(input: String, removePunctuations: Bool, removeNonPrint: Bool, removeSpecials: Bool, removeNumbers: Bool) -> String {
        var output = input
        
        if removePunctuations {
            output = removePunctuationChars(input: output)
        }
        
        if removeNonPrint {
            output = removeNonPrintChars(input: output)
        }
        
        if removeSpecials {
            output = removeSpecialChars(input: output)
        }
        
        if removeNumbers { 
            output = removeNumericCharacters(input: output)
        }
        
        return output
    }
    
    // Find Attack Type & Probability 
    func analyzeInput(payload: String, removePunctuations: Bool, removeNonPrint: Bool, removeSpecials: Bool, removeNumbers: Bool, completion: @escaping (Result<AnalysisReport,AnalysisError>) -> Void) {
        if payload.isEmpty {
            completion(.failure(.emptyInput))
            return
        }
        do {
            let config = MLModelConfiguration()
            let model = try PurifyML(configuration: config)
            
            let length = findLength(payload: payload)
            let nonPrintChars = findNonPrintChars(payload: payload)
            let specialChars = findPunctuationChars(payload: payload)
            let sqlKeys = findSqlKeys(payload: payload)
            let jsKeys = findJsKeys(payload: payload)
            let cmdKeys = findCmdKeys(payload: payload)
            
            print("Length: \(length), NonPrint: \(nonPrintChars), specialChars: \(specialChars), SQL: \(sqlKeys), JS: \(jsKeys), CMD: \(cmdKeys)")
            
            let prediction = try model.prediction(length: Int64(length), nonPrint: Int64(nonPrintChars), specialChars: Int64(specialChars), sqlKeys: Int64(sqlKeys), jsKeys: Int64(jsKeys), cmdKeys: Int64(cmdKeys))
            
            let probability = (prediction.labelProbability[prediction.label] ?? 0.0) * 100
            
            let filter = sanitize(input: payload, removePunctuations: removePunctuations, removeNonPrint: removeNonPrint, removeSpecials: removeSpecials, removeNumbers: removeNumbers)
            
            print("Probability: \(probability)")
            
            let analysisReport = AnalysisReport(payload: payload, filter: filter, label: prediction.label, labelProbability: probability, length: length, nonPrintChars: nonPrintChars, specialChars: specialChars, sqlKeys: sqlKeys, jsKeys: jsKeys, cmdKeys: cmdKeys)
            
            print(prediction.label, prediction.labelProbability)
            completion(.success(analysisReport))
        } catch {
            completion(.failure(.mlError))
        }
    }
}


