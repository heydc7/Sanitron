import SwiftUI

struct ConclusionView: View {
    
    @State private var showSheet = false
    
    var body: some View {
        List {
            Section {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Validate all the things")
                        .font(.title)
                        .bold()
                    
                    Text("Input validation is a programming technique that ensures only properly formatted data may enter a software system component.")
                        .font(.headline)
                }.padding()
            }
            
            Section {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Implementation")
                        .font(.title)
                        .bold()
                    
                    Text("Input validation can be implemented by:")
                        .font(.headline)
                    
                    Text("1. An Allow List or Deny List")
                        .font(.headline)
    
                    Text("2. Validation or Sanitization")
                        .font(.headline)
    
                    Text("3. Server-side & Client-side Validation")
                        .font(.headline)
                }.padding()
            }
            
            Section {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Quiz")
                        .font(.title)
                        .bold()
                    
                    Text("A simple quiz about what you've just learned about injection attacks")
                        .bold()
                    
                    Button {
                        self.showSheet = true
                    } label: {
                        Text("Start Quiz")
                            .font(.headline)
                            .frame(width: 100, height: 30)
                    }.buttonStyle(.borderedProminent)
                        .tint(.blue)
                }.padding()
            }
            
            Section {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Wrap up")
                        .font(.title)
                        .bold()
                    
                    Text("Narrowing of input data attacker can supply is the best technique to reduce the attack surface of the application, but should not be used as a primary method of protection against injection attacks. Until then, stay secure!")
                        .font(.headline)

                }.padding()
            }
        }
        .navigationTitle("Conclusion")
        .sheet(isPresented: self.$showSheet) {
            QuizView()
        }
    }
}

#Preview {
    ConclusionView()
}
