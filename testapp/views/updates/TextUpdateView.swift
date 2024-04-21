import SwiftUI
import Foundation

struct TextUpdateView: View {
    @Binding var textUpdate: Bool
    @State private var message = ""
    @State var color = Color.green

    
    var body: some View {
            VStack {
                TextUpdateToolbarView(textUpdate: $textUpdate, color: $color)
                
                VStack {
                    
                    TextField("Type a status", text: $message)
                        .padding(8)
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .accentColor(.white)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .textFieldStyle(PlainTextFieldStyle())
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal)


                }.frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                
                BottomSendTextUpdateView()
            }
            .background(color)
        }
}

struct TextUpdateToolbarView: View {
    @Binding var textUpdate: Bool
    @Binding var color: Color
    
    var colors = [Color.blue, Color.cyan, Color.brown, Color.gray]
    @State private var colorIndex = 0

    var body: some View {
        HStack {
            Image(systemName: "xmark")
                .foregroundColor(.white)
                .padding()
                .font(.system(size: 20)).onTapGesture {
                    textUpdate = false
                }
            
            Spacer()

            Image(systemName: "textformat.size.larger").foregroundColor(.white)
                .font(.system(size: 20))

            Image(systemName: "paintpalette").foregroundColor(.white).padding()
                .font(.system(size: 20))
                .onTapGesture {
                    colorIndex = (colorIndex + 1) % colors.count
                    color = colors[colorIndex]
                }
        }
    }
}

struct BottomSendTextUpdateView: View {
    @State private var newMessage: String = "hello"
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Spacer()
                    Button(action: {
                        // Handle send button action
                        // You can send the message or perform any other action
                        print("Send button tapped with message: \(newMessage)")
                        //                        newMessage = "" // Clear the text field after sending
                        let firestoreDataManager = FirestoreDataManager()
                        firestoreDataManager.addDocument(collection: "postStatus", data: generateAMockUpdate()) { result in print(result)
                        }
                        
                    }) {
                        Image(systemName: "paperplane")
                            .padding(8)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        
                    }
                }
                .padding().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            .background(.secondary)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    TextUpdateView(textUpdate: .constant(true))  // Use .constant(true) to initialize the binding
}
