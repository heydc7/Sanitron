import SwiftUI

enum ActionSheet : Identifiable {
    case first
    case second
    
    var id: Int {
        self.hashValue
    }
}
