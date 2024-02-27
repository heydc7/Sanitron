import SwiftUI

struct ResultView: View {
    
    @Binding var analysisReport: AnalysisReport
    @Binding var showFilter: Bool
    
    @ObservedObject var audioVM = AudioViewModel()
 
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Result")) {
                    HStack {
                        Spacer()
                        VStackLayout(alignment: .center, spacing: 16) {
                            if(analysisReport.label == "LEGIT") {
                                Image(systemName: "checkmark.seal.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.green)
                                
                                Text("Valid Input")
                                    .font(.title)
                                    .bold()
                                
                                Text("LEGIT")
                                    .font(.title)
                                    .bold()
                                
                                Text("Confidence: \(analysisReport.labelProbability, specifier: "%.2f")%")
                                    .font(.title3)
                                    .bold()
                            } else {
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.yellow)
                                
                                Text("Malicious Input")
                                    .font(.title)
                                    .bold()
                                
                                Text(analysisReport.label)
                                    .font(.largeTitle)
                                    .bold()
                                
                                Text("Confidence: \(analysisReport.labelProbability, specifier: "%.2f")%")
                                    .font(.title3)
                                    .bold()
                            }
                        }
                        Spacer()
                    }
                }
                
                Section(header: Text("Details")) {
                    HStack {
                        Text("Payload: ")
                            .bold()
                        Text("\(analysisReport.payload)")
                        Spacer()
                    }
                    
                    if showFilter {
                        HStack {
                            Text("Sanitized: ")
                                .bold()
                            Text("\(analysisReport.filter)")
                            Spacer()
                        }
                    }
                }
                
                Section(header: Text("Features")) {
                    ResultCell(txt: "Length: \(analysisReport.length)", index: 1)
                    ResultCell(txt: "Non-printable Characters: \(analysisReport.nonPrintChars)", index: 2)
                    ResultCell(txt: "Punctuation Characters: \(analysisReport.specialChars)", index: 3)
                    ResultCell(txt: "Javascript Keywords: \(analysisReport.jsKeys)", index: 4)
                    ResultCell(txt: "SQL Keywords: \(analysisReport.sqlKeys)", index: 5)
                    ResultCell(txt: "Command Keywords: \(analysisReport.cmdKeys)", index: 6)
                }
                
                if(analysisReport.label != "LEGIT") {
                    Section(header: Text("Mitigation")) {
                        if(analysisReport.label == "XSS") {
                            MitigateCell(index: 1, txt: "Input Sanitization", detail: "Filter and sanitize user input to remove or encode potentially dangerous characters.")
                            MitigateCell(index: 2, txt: "Output Encoding", detail: "Encode output to prevent browsers from executing injected scripts.")
                            MitigateCell(index: 3, txt: "Content Security Policy (CSP)", detail: "Implement CSP headers to restrict the sources from which content can be loaded.")
                        } else if(analysisReport.label == "SQLI") {
                            MitigateCell(index: 1, txt: "Input Validation", detail: "Validate and sanitize user input to ensure it conforms to expected data types and formats.")
                            MitigateCell(index: 2, txt: "Parameterized Queries", detail: "Use parameterized queries or prepared statements to separate SQL code from user input.")
                            MitigateCell(index: 3, txt: "Least Privilege Principle", detail: "Limit database permissions to reduce the impact of successful SQL injection attacks.")
                        } else if(analysisReport.label == "CMDI") {
                            MitigateCell(index: 1, txt: "Avoid Shell Commands", detail: "Whenever possible, avoid executing shell commands based on user input.")
                            MitigateCell(index: 2, txt: "Input Validation", detail: "Validate and sanitize user input to prevent malicious injection of shell metacharacters.")
                            MitigateCell(index: 3, txt: "Whitelisting", detail: "Use whitelisting to restrict allowed characters or commands, rather than blacklisting.")
                        }
                    }
                }
            }
            .navigationBarTitle("Analysis Report", displayMode: .inline)
            .onAppear {
                audioVM.playSuccessSound()
            }
        }
    }
}

#Preview {
    ResultView(analysisReport: .constant(AnalysisReport(payload: "<script>alert('xss')</script>", filter: "xss", label: "XSS", labelProbability: 12.23, length: 25, nonPrintChars: 3, specialChars: 21, sqlKeys: 12, jsKeys: 34, cmdKeys: 12)), showFilter: .constant(true))
}
