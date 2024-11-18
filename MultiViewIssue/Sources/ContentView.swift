import SwiftUI
import Engine

public struct ContentView: View {
    public init() {}

    public var body: some View {
        MultiViewAdapter {
            Section {
                Text("One")
                Text("Two")
                Text("Three")
            } header: {
                Text("Header")
            } footer: {
                Text("Footer")
            }
            .border(.red)
            .font(.title)
        } content: { subviews in
            ForEachSubview(subviews) { index, subview in
                VStack {
                    Text("index: \(index)")
                    subview
                }
            }
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
