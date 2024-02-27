import SwiftUI

struct InspectorView: View {
    
    @State private var inputStr = ""
    
    @ObservedObject var inspectorVM = InspectorViewModel()
    
    @State private var showResult = false
    
    @State private var actionSheet: ActionSheet?
    
    @State private var analysisReport = AnalysisReport(payload: "", filter: "", label: "", labelProbability: 0.0, length: 0, nonPrintChars: 0, specialChars: 0, sqlKeys: 0, jsKeys: 0, cmdKeys: 0)
    
    // SANITIZER VARIABLES
    @State private var isOn = false
    @State private var removePunctuations = false
    @State private var removeNonPrint = false
    @State private var removeNumbers = false
    @State private var removeSpecials = false
    
    // ALERT
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMsg = ""
    
    var body: some View {
        List {
            Section(header: Image("cover").resizable().scaledToFit().cornerRadius(12)) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Welcome to Input Inspector!!!")
                        .font(.title)
                        .bold()
                    
                    Text("Please add your input in the Inspector Textfield below. Also, you can use the sample payload dataset provided below.")
                }.padding()
            }
            
            Section(
                header: Text("Inspector"),
                footer: HStack {
                    Spacer()
                    
                    Button {
                        actionSheet = .second
                    } label: {
                        Label("Dataset", systemImage: "doc.text")
                            .font(.headline)
                            .frame(width: 130, height: 30)
                    }.buttonStyle(.borderedProminent)
                        .tint(.orange)
                        .padding([.horizontal, .top])
                    
                    Button {
                        analyzeInput()
                    } label: {
                        Label("Inspect", systemImage: "bolt.shield")
                            .font(.headline)
                            .frame(width: 130, height: 30)
                    }.buttonStyle(.borderedProminent)
                        .tint(.blue)
                        .padding([.horizontal, .top])
                    
                    Spacer()
                }
            ) {
                HStack {
                    TextField("Input", text: $inputStr, prompt: Text("Enter your name, not anything else!"))
                        .keyboardType(.default)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.none)
                        .autocapitalization(.none)
                    
                    Spacer()
                    
                    if self.inputStr.isEmpty {
                        Button {
                            self.inputStr = UIPasteboard.general.string ?? ""
                        } label: {
                            Image(systemName: "doc.on.clipboard.fill")
                                .imageScale(.large)
                                .foregroundColor(.green)
                        }
                    } else {
                        Button {
                            self.inputStr = ""
                        } label: {
                            Image(systemName: "multiply.circle.fill")
                                .imageScale(.large)
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            
            Section {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Sanitron Settings")
                        .font(.title)
                        .bold()
                    
                    Text("Customize settings in order to filter specific characters")
                    
                    CheckCell(title: "Status: \(isOn ? "ON" : "OFF")", isSelected: $isOn)
                    
                    if isOn {
                        CheckCell(title: "Filter punctuation characters", isSelected: $removePunctuations)
                        CheckCell(title: "Filter non-printable characters", isSelected: $removeNonPrint)
                        CheckCell(title: "Filter special characters", isSelected: $removeSpecials)
                        CheckCell(title: "Filter numeric characters", isSelected: $removeNumbers)
                    }
                    
                }.padding()
            }
            
            Section {
                VStack(alignment: .leading, spacing: 16) {
                    Text("PurifyML: ML Model")
                        .font(.title)
                        .bold()
                    
                    Text("The PuritfyML model is a tabular classification model trained using CreateML, specifically utilizing the Random Forest algorithm. With six input features, it categorizes input data into predefined labels, providing both predicted labels and corresponding probability scores for each prediction.")
                    Text("This approach offers a reliable and interpretable solution for classifying data, making informed decisions, and assessing the confidence of the model's predictions.")
                    
                }.padding()
            }
        }
        .navigationTitle("Input Inspector")
        .sheet(item: self.$actionSheet) { item in
            switch item {
            case .first:
                ResultView(analysisReport: $analysisReport, showFilter: $isOn)
            case .second:
                DatasetView(selectedPayload: self.$inputStr)
            }
        }
        .alert(isPresented: self.$showAlert) {
            Alert(title: Text(self.alertTitle), message: Text(self.alertMsg), dismissButton: .default(Text("Ok")))
        }
    }
    
    func analyzeInput() {
        inspectorVM.analyzeInput(payload: inputStr, removePunctuations: removePunctuations, removeNonPrint: removeNonPrint, removeSpecials: removeSpecials, removeNumbers: removeNumbers) { result in 
            switch(result) {
                case .success(let report):
                    print(report)
                    self.analysisReport = report
                    self.actionSheet = .first
                case .failure(let err):
                    print(err)
                    if err == .emptyInput {
                        self.showAlertView(title: "Invalid Input", msg: "Please enter your input in the textfield")
                    } else if err == .mlError {
                        self.showAlertView(title: "ML Model Error", msg: "Failed to load PurifyML model")
                    }
            }
        }
    }
    
    // Show Alert
    func showAlertView(title: String, msg: String) {
        self.alertTitle = title
        self.alertMsg = msg
        self.showAlert = true
    }
}

#Preview {
    InspectorView()
}
