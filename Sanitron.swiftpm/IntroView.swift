import SwiftUI

struct IntroView: View {
    var body: some View {
        List {
            Section(header: Image("cover").resizable().scaledToFit().cornerRadius(12)) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Sanitron")
                        .font(.title)
                        .bold()
                    
                    Text("Welcome to the Sanitron, a Swift Playground App designed to provide an interactive learning experience for understanding and detecting various injection attacks. This app utilizes Machine Learning algorithms to showcase how different types of injection attacks, including Cross-Site Scripting (XSS), SQL Injection (SQLI), and Command Injection (CMDI), can be identified and mitigated in real-time.")
                }.padding()
            }
            
            Section {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Why?")
                        .font(.title)
                        .bold()
                    
                    Text("In today's digital landscape, companies often offer services through both websites and apps. Websites often employ firewalls like Cloudflare, which block potentially harmful input payloads directly on the client-side. However, apps typically lack such client-side protections and rely on server-side APIs for input handling and validation, leaving them vulnerable to injection attacks.")
                    
                    Text("To address this vulnerability, I developed this app integrated with machine learning capabilities to detect injection attacks at the client-side, showcasing effective practices for input validation and sanitization to bolster security measures.")
                }.padding()
            }
            
            Section(footer: Text("Source: HackerOne Hacker-Powered Security Report 2023")) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("How injection attacks occur?")
                        .font(.title)
                        .bold()
                    
                    Text("Improper Input Validation allows attackers to inject malicious input that is then executed by the vulnerable application.")
                    
                    Text("Lack of input validation & sanitization can lead to various attacks including Cross-site Scripting(XSS), SQL Injection, Command Injection & Server Side Request Forgery(SSRF), etc.")
                    
                    Text("According to Hackerone's Hacker-Powered Security Report 2023, top 10 high & critical vulnerabilities listed as below:")
                    
                    PieChartView()
                        .frame(height: 500)
                        .padding(.vertical)
                    
                    Text("Among these top 10 vulnerabilities, injection attacks broken out into Cross-site Scripting(XSS), SQL Injection, Command Injection & Server Side Request Forgery(SSRF), comprising 18% of all vulnerabilities reported through the HackerOne platform.")
                }.padding()
            }
            
            Section {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Injection Attack Types")
                        .font(.title)
                        .bold()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("1. Cross-Site Scripting (XSS)")
                            .font(.title3)
                            .bold()
                        Text("An arbitrary script, typically written in JavaScript, is injected by the attacker into a legitimate website or web application. This script is then executed inside the victim’s browser.")
                    }.padding(.top)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("2. SQL Injection (SQLi)")
                            .font(.title3)
                            .bold()
                        Text("SQL queries that can read or change database data are injected by the attacker. Advanced SQL Injection attacks give the attacker the ability to write any file to the server and even run OS commands using SQL commands. This could result in a complete system breach.")
                    }.padding(.top)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("3. Command Injection Injection (CMDi)")
                            .font(.title3)
                            .bold()
                        Text("With the user's privileges, the attacker inserts operating system commands into the web application. In more complex situations, the attacker might use other vulnerabilities for privilege escalation, which could result in a complete breach of the system.")
                    }.padding(.top)
                }.padding()
            }
        }
        .navigationTitle("Getting started")
    }
}

#Preview {
    IntroView()
}
