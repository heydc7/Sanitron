//
// PurifyML.swift
//
// This file was automatically generated and should not be edited.
//

import CoreML


/// Model Prediction Input Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class PurifyMLInput : MLFeatureProvider {
    
    /// length as integer value
    var length: Int64
    
    /// nonPrint as integer value
    var nonPrint: Int64
    
    /// specialChars as integer value
    var specialChars: Int64
    
    /// sqlKeys as integer value
    var sqlKeys: Int64
    
    /// jsKeys as integer value
    var jsKeys: Int64
    
    /// cmdKeys as integer value
    var cmdKeys: Int64
    
    var featureNames: Set<String> {
        get {
            return ["length", "nonPrint", "specialChars", "sqlKeys", "jsKeys", "cmdKeys"]
        }
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "length") {
            return MLFeatureValue(int64: length)
        }
        if (featureName == "nonPrint") {
            return MLFeatureValue(int64: nonPrint)
        }
        if (featureName == "specialChars") {
            return MLFeatureValue(int64: specialChars)
        }
        if (featureName == "sqlKeys") {
            return MLFeatureValue(int64: sqlKeys)
        }
        if (featureName == "jsKeys") {
            return MLFeatureValue(int64: jsKeys)
        }
        if (featureName == "cmdKeys") {
            return MLFeatureValue(int64: cmdKeys)
        }
        return nil
    }
    
    init(length: Int64, nonPrint: Int64, specialChars: Int64, sqlKeys: Int64, jsKeys: Int64, cmdKeys: Int64) {
        self.length = length
        self.nonPrint = nonPrint
        self.specialChars = specialChars
        self.sqlKeys = sqlKeys
        self.jsKeys = jsKeys
        self.cmdKeys = cmdKeys
    }
    
}


/// Model Prediction Output Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class PurifyMLOutput : MLFeatureProvider {
    
    /// Source provided by CoreML
    private let provider : MLFeatureProvider
    
    /// label as string value
    var label: String {
        return self.provider.featureValue(for: "label")!.stringValue
    }
    
    /// labelProbability as dictionary of strings to doubles
    var labelProbability: [String : Double] {
        return self.provider.featureValue(for: "labelProbability")!.dictionaryValue as! [String : Double]
    }
    
    var featureNames: Set<String> {
        return self.provider.featureNames
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        return self.provider.featureValue(for: featureName)
    }
    
    init(label: String, labelProbability: [String : Double]) {
        self.provider = try! MLDictionaryFeatureProvider(dictionary: ["label" : MLFeatureValue(string: label), "labelProbability" : MLFeatureValue(dictionary: labelProbability as [AnyHashable : NSNumber])])
    }
    
    init(features: MLFeatureProvider) {
        self.provider = features
    }
}


/// Class for model loading and prediction
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class PurifyML {
    let model: MLModel
    
    /// URL of model assuming it was installed in the same bundle as this class
    class var urlOfModelInThisBundle : URL {
        let bundle = Bundle(for: self)
        return bundle.url(forResource: "PurifyML", withExtension:"mlmodelc")!
    }
    
    /**
     Construct PurifyML instance with an existing MLModel object.
     
     Usually the application does not use this initializer unless it makes a subclass of PurifyML.
     Such application may want to use `MLModel(contentsOfURL:configuration:)` and `PurifyML.urlOfModelInThisBundle` to create a MLModel object to pass-in.
     
     - parameters:
     - model: MLModel object
     */
    init(model: MLModel) {
        self.model = model
    }
    
    /**
     Construct PurifyML instance by automatically loading the model from the app's bundle.
     */
    @available(*, deprecated, message: "Use init(configuration:) instead and handle errors appropriately.")
    convenience init() {
        try! self.init(contentsOf: type(of:self).urlOfModelInThisBundle)
    }
    
    /**
     Construct a model with configuration
     
     - parameters:
     - configuration: the desired model configuration
     
     - throws: an NSError object that describes the problem
     */
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    convenience init(configuration: MLModelConfiguration) throws {
        try self.init(contentsOf: type(of:self).urlOfModelInThisBundle, configuration: configuration)
    }
    
    /**
     Construct PurifyML instance with explicit path to mlmodelc file
     - parameters:
     - modelURL: the file url of the model
     
     - throws: an NSError object that describes the problem
     */
    convenience init(contentsOf modelURL: URL) throws {
        try self.init(model: MLModel(contentsOf: modelURL))
    }
    
    /**
     Construct a model with URL of the .mlmodelc directory and configuration
     
     - parameters:
     - modelURL: the file url of the model
     - configuration: the desired model configuration
     
     - throws: an NSError object that describes the problem
     */
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    convenience init(contentsOf modelURL: URL, configuration: MLModelConfiguration) throws {
        try self.init(model: MLModel(contentsOf: modelURL, configuration: configuration))
    }
    
    /**
     Construct PurifyML instance asynchronously with optional configuration.
     
     Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.
     
     - parameters:
     - configuration: the desired model configuration
     - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
     */
    @available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    class func load(configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<PurifyML, Error>) -> Void) {
        return self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration, completionHandler: handler)
    }
    
    /**
     Construct PurifyML instance asynchronously with optional configuration.
     
     Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.
     
     - parameters:
     - configuration: the desired model configuration
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    class func load(configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> PurifyML {
        return try await self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration)
    }
    
    /**
     Construct PurifyML instance asynchronously with URL of the .mlmodelc directory with optional configuration.
     
     Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.
     
     - parameters:
     - modelURL: the URL to the model
     - configuration: the desired model configuration
     - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
     */
    @available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<PurifyML, Error>) -> Void) {
        MLModel.load(contentsOf: modelURL, configuration: configuration) { result in
            switch result {
            case .failure(let error):
                handler(.failure(error))
            case .success(let model):
                handler(.success(PurifyML(model: model)))
            }
        }
    }
    
    /**
     Construct PurifyML instance asynchronously with URL of the .mlmodelc directory with optional configuration.
     
     Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.
     
     - parameters:
     - modelURL: the URL to the model
     - configuration: the desired model configuration
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> PurifyML {
        let model = try await MLModel.load(contentsOf: modelURL, configuration: configuration)
        return PurifyML(model: model)
    }
    
    /**
     Make a prediction using the structured interface
     
     - parameters:
     - input: the input to the prediction as PurifyMLInput
     
     - throws: an NSError object that describes the problem
     
     - returns: the result of the prediction as PurifyMLOutput
     */
    func prediction(input: PurifyMLInput) throws -> PurifyMLOutput {
        return try self.prediction(input: input, options: MLPredictionOptions())
    }
    
    /**
     Make a prediction using the structured interface
     
     - parameters:
     - input: the input to the prediction as PurifyMLInput
     - options: prediction options 
     
     - throws: an NSError object that describes the problem
     
     - returns: the result of the prediction as PurifyMLOutput
     */
    func prediction(input: PurifyMLInput, options: MLPredictionOptions) throws -> PurifyMLOutput {
        let outFeatures = try model.prediction(from: input, options:options)
        return PurifyMLOutput(features: outFeatures)
    }
    
    /**
     Make an asynchronous prediction using the structured interface
     
     - parameters:
     - input: the input to the prediction as PurifyMLInput
     - options: prediction options 
     
     - throws: an NSError object that describes the problem
     
     - returns: the result of the prediction as PurifyMLOutput
     */
    @available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, *)
    func prediction(input: PurifyMLInput, options: MLPredictionOptions = MLPredictionOptions()) async throws -> PurifyMLOutput {
        let outFeatures = try await model.prediction(from: input, options:options)
        return PurifyMLOutput(features: outFeatures)
    }
    
    /**
     Make a prediction using the convenience interface
     
     - parameters:
     - length as integer value
     - nonPrint as integer value
     - specialChars as integer value
     - sqlKeys as integer value
     - jsKeys as integer value
     - cmdKeys as integer value
     
     - throws: an NSError object that describes the problem
     
     - returns: the result of the prediction as PurifyMLOutput
     */
    func prediction(length: Int64, nonPrint: Int64, specialChars: Int64, sqlKeys: Int64, jsKeys: Int64, cmdKeys: Int64) throws -> PurifyMLOutput {
        let input_ = PurifyMLInput(length: length, nonPrint: nonPrint, specialChars: specialChars, sqlKeys: sqlKeys, jsKeys: jsKeys, cmdKeys: cmdKeys)
        return try self.prediction(input: input_)
    }
    
    /**
     Make a batch prediction using the structured interface
     
     - parameters:
     - inputs: the inputs to the prediction as [PurifyMLInput]
     - options: prediction options 
     
     - throws: an NSError object that describes the problem
     
     - returns: the result of the prediction as [PurifyMLOutput]
     */
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    func predictions(inputs: [PurifyMLInput], options: MLPredictionOptions = MLPredictionOptions()) throws -> [PurifyMLOutput] {
        let batchIn = MLArrayBatchProvider(array: inputs)
        let batchOut = try model.predictions(from: batchIn, options: options)
        var results : [PurifyMLOutput] = []
        results.reserveCapacity(inputs.count)
        for i in 0..<batchOut.count {
            let outProvider = batchOut.features(at: i)
            let result =  PurifyMLOutput(features: outProvider)
            results.append(result)
        }
        return results
    }
}
