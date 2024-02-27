import Foundation

struct AnalysisReport {
    var payload: String
    var filter: String
    var label : String
    var labelProbability: Double
    var length: Int
    var nonPrintChars: Int
    var specialChars: Int
    var sqlKeys: Int
    var jsKeys: Int
    var cmdKeys: Int
}

