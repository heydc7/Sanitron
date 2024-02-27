import SwiftUI

struct FeaturesView: View {
    var body: some View {
        List {
            Section {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Feature Extraction")
                        .font(.title)
                        .bold()
                    
                    Text("Feature extraction is the process of identifying and extracting relevant features from raw data.")
                    
                    Text("In this section, we are going to learn about various features that will help to effectively classify the user input into various injection attacks.")
                }.padding()
            }
            
            Section(footer: Text("Source: GitHub(1. danielmiessler/SecLists, 2.swisskyrepo/PayloadsAllTheThings)")) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Data Collection")
                        .font(.title)
                        .bold()
                    
                    Text("Payload Dataset")
                        .font(.headline)
                    
                    Text("The dataset consists of the following four category wordlists & each entry in the wordlist is represented by a label that denotes whether it is legitimate or malicious input.")
                    
                    
                    
                    Text("1. Cross-Site Scripting (XSS): 6578")
                    Text("2. SQL Injection (SQLI): 1464")
                    Text("3. Command Injection (CMDI): 637")
                    Text("4. Legitimate Inputs (LEGIT): 12804")
                    
                    Text("")
                    
                    Text("Keyword Dataset")
                        .font(.headline)
                    
                    Text("For feature extraction, the following keyword wordlists are used to identify the type of attack.")
                    
                    Text("1. Javascript Keywords: 219")
                    Text("2. SQL Keywords: 700")
                    Text("3. Command Keywords: 159")
                }.padding()
            }
            
            Section(footer: Text("these files are present in 'Other' folder")) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Extracting Features using Python")
                        .font(.title)
                        .bold()
                    
                    Text("1. Used Google Colab Notebook with Python(PureML.ipynb)")
                    Text("2. 6 features are extracted based on injection attack types(allFeatures.csv)")
                    Text("3. The 'label' column consists of 3 injection attacks(XSS, SQLI, CMDI) & 1 legitimate input(LEGIT)")
                }.padding()
            }
            
            Section {
                FeatureCell(title: "1. Payload Length", description: "This feature represents the length of the provided input payload. It measures the number of characters in the input string, including spaces,  special characters, and punctuation characters.", importance: "Longer payloads indicate attempts to exploit input fields, potentially leading to injection attacks.")
            }
            
            Section {
                FeatureCell(title: "2. Number of Non-Printable Characters", description: "This feature counts the number of non-printable characters in the input payload, such as control characters or Unicode characters that do not have a visible representation.", importance: "Non-printable characters are often used in obfuscation techniques to bypass input validation and evade detection mechanisms. An unusually high count of non-printable characters may indicate malicious intent.")
            }
            
            Section {
                FeatureCell(title: "3. Number of Punctuation Characters", description: "This feature calculates the total number of punctuation characters present in the input payload. Punctuation characters include symbols such as commas, periods, exclamation marks, and question marks.", importance: "Punctuation characters are commonly used in injection attacks to separate commands or concatenate strings. Monitoring their frequency can help detect suspicious input patterns.")
            }
            
            Section {
                FeatureCell(title: "4. Number of SQL Keywords", description: "This feature counts the occurrences of SQL-specific keywords in the input payload, such as SELECT, INSERT, UPDATE, DELETE, JOIN, etc.", importance: "SQL injection attacks exploit vulnerabilities in SQL queries by injecting malicious SQL code. Monitoring the presence of SQL keywords can help identify attempts to manipulate database queries.")
            }
            
            Section {
                FeatureCell(title: "5. Number of JS Keywords", description: "This feature computes the occurrences of JavaScript keywords in the input payload, including keywords like function, if, else, while, etc.", importance: "Cross-site scripting (XSS) attacks involve injecting malicious JavaScript code into web applications. Detecting the presence of JavaScript keywords can aid in identifying potential XSS vulnerabilities.")
            }
            
            Section {
                FeatureCell(title: "6. Number of OS Command Keywords", description: "This feature tracks the frequency of keywords related to operating system commands, such as cmd.exe commands in Windows or shell commands in Unix-based systems.", importance: "Command Injection attacks exploit vulnerabilities that allow attackers to execute arbitrary commands on the underlying operating system. Monitoring the occurrence of OS command keywords can help detect attempts to execute unauthorized commands.")
            }
            
        }
        .navigationTitle("Inspector Features")
    }
}

#Preview {
    FeaturesView()
}
