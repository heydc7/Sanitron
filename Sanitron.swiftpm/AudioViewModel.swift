import SwiftUI
import AVKit

class AudioViewModel: ObservableObject {
    
    var audioPlayer: AVAudioPlayer?
    
    @Published var current: String = ""
    
    var audioFiles = ["success", "error"]
    
    func playSuccessSound() {
        if let path = Bundle.main.path(forResource: audioFiles[0], ofType: "wav") {
            do {
                let url = URL(fileURLWithPath: path)
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("File Not Found")
            }
        }
    }
    
    
    func playErrorSound() {
        if let path = Bundle.main.path(forResource: audioFiles[1], ofType: "wav") {
            do {
                let url = URL(fileURLWithPath: path)
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("File Not Found")
            }
        }
    }
}
