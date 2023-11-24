import SwiftUI

struct E: View {
    var body: some View {
        NavigationView {
            List{
                Text("Uiop")
            }
            .navigationTitle("Feed")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            // Handle action for the leading button
                        }) {
                            Image(systemName: "gear")
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            Button(action: {
                                // Handle action for the first trailing button
                            }) {
                                Image(systemName: "plus")
                            }
                            
                            Button(action: {
                                // Handle action for the second trailing button
                            }) {
                                Image(systemName: "bell")
                            }
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Text("Custom Text")
                            .foregroundColor(.blue)
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        E()
    }
}
