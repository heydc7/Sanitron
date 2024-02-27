import SwiftUI

struct ResultCell: View {
    
    var txt: String
    var index: Int
    
    var body: some View {
        HStack {
            Image(systemName: "\(index).circle")
                .imageScale(.large)
                .foregroundColor(.blue)
            
            Text("\(txt)")
                .font(.headline)
        }
    }
}

#Preview {
    ResultCell(txt: "test", index: 1)
}
