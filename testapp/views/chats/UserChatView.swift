import SwiftUI

struct UserChatView: View {
    var user: ChatItem
    
    var body: some View {
        ZStack(alignment: .bottom) {
            MessageDisplayView(messages: generateMockMessages(count: 30))
                .navigationBarItems(
                    leading: HStack {
                        Spacer()
                        CircleAvatar(imageName: "", size: 35)
                        Text("\(user.name)")
                        Spacer()                            },
                    trailing: HStack {
                        
                        Button(action: {
                            // Handle action for the phone icon
                        }) {
                            Image(systemName: "phone")
                        }
                    }
                )
            
            BottomSendMessageView()
                        
        }
    }

}

struct MessageDisplayView: View {
    var messages: Array<MessageItem>
    
    var body: some View {
        List {
            ForEach(messages, id: \.id) { message in
                MessageDisplayItem()
            }
        }.listStyle(PlainListStyle()).padding(.bottom, 6)
    }
}

struct BottomSendMessageView: View {
    @State private var newMessage: String = ""

    var body: some View {
        VStack {
            HStack {
                HStack {
                    TextField("Type a message...", text: $newMessage)
                        .padding(8)
                        .cornerRadius(8)
                    
                    Button(action: {
                        // Handle send button action
                        // You can send the message or perform any other action
                        print("Send button tapped with message: \(newMessage)")
                        newMessage = "" // Clear the text field after sending
                    }) {
                        Image(systemName: "paperplane")
                            .padding(8)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }.padding()
            }
            .background()
        }
    }
}

struct MessageDisplayItem: View {
    @State private var isShowingIcon = false
    
    var body: some View {
        ScrollView {
            HStack {
                    if isShowingIcon {
                        Image(systemName: "arrow.right.circle.fill")
                            .foregroundColor(.blue)
                            .font(.title)
                            .onTapGesture {
                                // Handle your swipe action here
                                print("Swiped right!")
                            }
                    }

                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("OK, I will come by tommorrow. So I will try to be very early.").padding(5)
                        
                        Text("4:89").padding(4)
                    }
                    .cornerRadius(3.0)
                    .background(RoundedRectangle(cornerRadius: 8)  .fill(Color.blue)
                                            .foregroundColor(.white)
                                    )                .foregroundColor(.white)
                    .padding(4)
                    .fixedSize(horizontal: false, vertical: true)
                    .contextMenu(ContextMenu(menuItems: {
                        Button(action: {}) {
                            HStack {
                                Text("Copy")
                                Image(systemName: "copy")
                            }
                        }
                        Button(action: {}) {
                            HStack {
                                Text("Delete")
                                Image(systemName: "trash")
                            }
                        }
                    }))
                    
            }            
        }
    }
}

struct UserChatView_Previews: PreviewProvider {
    static var previews: some View {
        return UserChatView(user: generateMockChatItem())
    }
}
