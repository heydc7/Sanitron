import Foundation

struct Question: Identifiable {
    
    var id = UUID()
    var txt : String
    var options : [Answer]
    
}
