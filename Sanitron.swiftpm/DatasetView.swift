import SwiftUI

struct DatasetView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var selectedPayload: String
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("XSS")) {
                    ForEach(Constants.Dataset.xss, id: \.self) { item in
                        Text(verbatim: item)
                            .lineLimit(nil)
                            .padding(6)
                            .onTapGesture {
                                self.selectedPayload = item
                                self.presentationMode.wrappedValue.dismiss()
                            }
                    }
                }
                Section(header: Text("SQLI")) {
                    ForEach(Constants.Dataset.sql, id: \.self) { item in
                        Text(verbatim: item)
                            .lineLimit(nil)
                            .padding(6)
                            .onTapGesture {
                                self.selectedPayload = item
                                self.presentationMode.wrappedValue.dismiss()
                            }
                    }
                }
                Section(header: Text("CMDI")) {
                    ForEach(Constants.Dataset.cmd, id: \.self) { item in
                        Text(verbatim: item)
                            .lineLimit(nil)
                            .padding(6)
                            .onTapGesture {
                                self.selectedPayload = item
                                self.presentationMode.wrappedValue.dismiss()
                            }
                    }
                }
                Section(header: Text("LEGIT")) {
                    ForEach(Constants.Dataset.legit, id: \.self) { item in
                        Text(verbatim: item)
                            .lineLimit(nil)
                            .padding(6)
                            .onTapGesture {
                                self.selectedPayload = item
                                self.presentationMode.wrappedValue.dismiss()
                            }
                    }
                }
            }
            .navigationTitle("Payload Dataset")
        }
    }
}

