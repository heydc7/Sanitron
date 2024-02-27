import SwiftUI

struct MitigateCell: View {
    
    var index: Int
    var txt: String
    var detail: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(index). \(txt) ")
                .bold()
            Text("\(detail)")
        }.padding(.vertical, 4)
    }
}

#Preview {
    MitigateCell(index: 1, txt: "test", detail: "details")
}
