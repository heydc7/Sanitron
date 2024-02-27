import SwiftUI

struct QuizView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let questions = [
        Question(
            txt: "What is the primary purpose of input validation?", 
            options: [
                Answer(txt: "To ensure that all inputs are accepted without any restriction", isCorrect: false), 
                Answer(txt: "To verify that inputs conform to specified criteria or constraints", isCorrect: true), 
                Answer(txt: "To encrypt input data for secure transmission", isCorrect: false), 
                Answer(txt: "To validate output data before displaying it to users", isCorrect: false)
            ]
        ), Question(
            txt: "Which type of attack involves inserting malicious code into web applications through input fields to manipulate the behavior of the application and affect other users?", 
            options: [
                Answer(txt: "Command Injection", isCorrect: false), 
                Answer(txt: "SQL Injection", isCorrect: false), 
                Answer(txt: "Cross-Site Scripting (XSS)", isCorrect: true), 
                Answer(txt: "CSRF (Cross-Site Request Forgery)", isCorrect: false)
            ]
        ), Question(
            txt: "How can SQL Injection attacks be prevented?", 
            options: [
                Answer(txt: "By using HTTPS encryption", isCorrect: false), 
                Answer(txt: "By installing antivirus software", isCorrect: false), 
                Answer(txt: "By disabling JavaScript in web browsers", isCorrect: false), 
                Answer(txt: "By implementing input validation and parameterized queries", isCorrect: true)
            ]
        ), Question(
            txt: "Which type of attack involves injecting operating system commands through vulnerable input fields to execute unauthorized actions on the server?", 
            options: [
                Answer(txt: "SQL Injection", isCorrect: false), 
                Answer(txt: "Cross-Site Scripting (XSS)", isCorrect: false), 
                Answer(txt: "Command Injection", isCorrect: true), 
                Answer(txt: "Buffer Overflow", isCorrect: false)
            ]
        ), Question(
            txt: "True or False: Input validation alone is sufficient to protect against all types of injection attacks.", 
            options: [
                Answer(txt: "True", isCorrect: false), 
                Answer(txt: "False", isCorrect: true), 
                
            ]
        )
    ]
    
    @State private var currentIndex = 0
    
    // Alert
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMsg = ""
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .center, spacing: 20) {
                QuestionView(index: currentIndex + 1, question: questions[currentIndex])
                
                Button {
                    showNext()
                } label: {
                    Text(currentIndex == 4 ? "Finish" : "Next")
                        .font(.headline)
                        .frame(width: 75, height: 30)
                }.buttonStyle(.borderedProminent)
                    .padding()
                
                Spacer()
            }.padding(24)
            
                .navigationTitle("Phishing Quiz")
                .navigationBarTitleDisplayMode(.inline)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(self.alertTitle), message: Text(self.alertMsg), dismissButton: .default(Text("Ok"), action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }))
                }
        }
    }
    
    func showNext() {
        if currentIndex == 4 {
            self.showAlertView(title: "Thank you!", msg: "I hope you've learned about injection attacks & prevention techniques.")
        } else {
            self.currentIndex += 1
        }
    }
    
    // Show Alert
    func showAlertView(title: String, msg: String) {
        self.alertTitle = title
        self.alertMsg = msg
        self.showAlert = true
    }
}
