import SwiftUI

struct AboutView: View {
    var body: some View {
        List {
            Section {
                VStack(alignment: .center, spacing: 20) {
                    Image("profilePic")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .padding(4)
                    
                    Text("Hey 👋")
                        .font(.title)
                        .bold()
                    
                    Text("I am Dhanraj Chavan")
                        .font(.title)
                        .bold()
                    
                    Text("Cybersecurity Graduate Student at New York University")
                        .font(.headline)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("I am very passionate about Coding & Technology, as well as converting my ideas into apps, encouraging others to code through my Blogs")
                            .multilineTextAlignment(.center)
                        
                        Text("I aimed to build Sanitron - Swift Playground App to demonstrate the potential of Machine Learning in identifying various injection attacks that target input fields & implement best practices for validating & sanitizing user input.")
                            .multilineTextAlignment(.center)
                    }
                    
                    Text("Thank you for checking out my Swift Playground App!")
                        .font(.title)
                        .bold()
                }.padding()
            }
        }
        .navigationTitle("About Me")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AboutView()
}
