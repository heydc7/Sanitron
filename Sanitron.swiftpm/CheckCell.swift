import SwiftUI

struct CheckCell: View {
    
    var title: String
    @Binding var isSelected: Bool
    
    var body: some View {
        Toggle(isOn: $isSelected, label: {
            Text(title)
                .font(.headline)
        })
    }
}

#Preview {
    CheckCell(title: "Set", isSelected: .constant(true))
}
