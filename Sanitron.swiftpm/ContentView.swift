import SwiftUI
import CoreML

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Intro")) {
                    NavigationLink(destination: IntroView()) { 
                        Label("Getting Started", systemImage: "doc.plaintext")
                    }
                    NavigationLink(destination: FeaturesView()) { 
                        Label("Inspector Features", systemImage: "point.3.connected.trianglepath.dotted")
                    }
                }
                Section(header: Text("Main")) {
                    NavigationLink(destination: InspectorView()) { 
                        Label("Input Inspector", systemImage: "rectangle.and.text.magnifyingglass")
                    }
                }
                Section(header: Text("Outro")) {
                    NavigationLink(destination: ConclusionView()) { 
                        Label("Conclusion", systemImage: "checkmark.square")
                    }
                    NavigationLink(destination: AboutView()) { 
                        Label("About Me", systemImage: "info.circle")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
