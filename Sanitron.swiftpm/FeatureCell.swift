import SwiftUI

struct FeatureCell: View {
    
    var title: String
    var description: String
    var importance: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.title)
                .bold()
            Text("Description:")
                .font(.headline)
                .padding(.top, 8)
            Text(description)
            
            Text("Importance:")
                .font(.headline)
                .padding(.top, 8)
            
            Text(importance)
        }.padding()
    }
}

#Preview {
    FeatureCell(title: "1. Payload Length", description: "Computes the length of the payload.", importance: "Computes the length of the payload.")
}
