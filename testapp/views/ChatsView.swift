//
//  ChatsView.swift
//  testapp
//
//  Created by Chidume Nnamdi on 21/11/2023.
//
import Foundation
import SwiftUI

struct ChatsView: View {
    
    private var chats = generateMockChatItems(count: 20)
    
    var body: some View {
        
        NavigationView {
            ChatList(chats: chats)
                .navigationTitle("Chats")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                                // Handle action for the leading button
                                            }) {
                                                Text( "Edit")
                                            }
                                }
                
                    
                }
//                .navigationTitle("Chats")
                .padding(0)
            
        }
    }
}

struct ChatList: View {
    var chats: Array<ChatItem>
    @State private var selectedChat: ChatItem?
    
    var body: some View {
        List {
            
            HStack{
                Text("Broadcast List")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Spacer()
                Text("New Group")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            
            ForEach(chats, id: \.id) { chat in
                ZStack {
                NavigationLink(
                    destination: UserChatView(user: chat)                               ) {
                        EmptyView()
                    }
                    .opacity(0.0)
                    .buttonStyle(PlainButtonStyle())
                HStack(alignment:VerticalAlignment.top, spacing: 10) {
                    CircleAvatar(imageName: "message", size: 55)
                    
                    VStack(
                        
                        alignment: HorizontalAlignment.leading) {
                            HStack {
                                Text("\(chat.name)")
                                    .bold()
                                
                                Spacer()
                                
                                TimeAgoView(time: chat.timestamp)
                                    .foregroundColor(.blue)
                            }                                .padding(.bottom, 1)
                            
                            
                            Text("\(chat.message)")
                        }.padding(.leading, 5)
                    
                }.padding(4)
                    .listRowInsets(EdgeInsets())            }
                        
                }
            
        }.listStyle(PlainListStyle())
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    }
}

struct TimeAgoView: View {
    var time: Date
    var body: some View {
        Text(timeAgoString(from: time))
    }
}

struct ChatsView_Previews: PreviewProvider {
    static var previews: some View {
        ChatsView()
    }
}


