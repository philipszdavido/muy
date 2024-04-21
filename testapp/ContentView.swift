//
//  ContentView.swift
//  testapp
//
//  Created by Chidume Nnamdi on 21/11/2023.
//

import SwiftUI

struct ContentView: View {


    var body: some View {
            TabView {
                
                ChatsView()
                    .tabItem {
                    Image(systemName: "message")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Chats")
                    }.tag(1)
                
                NavigationStack { UpdatesView()}.tabItem {
                    Image(systemName: "person.line.dotted.person")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Updates")
                    
                }.tag(2)
                
                FeedView().tabItem {
                    Image(systemName: "newspaper")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Feed")
                    
                }.tag(3)
                
                ContactsListView().tabItem {
                    Image(systemName: "phone")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Contacts")
                    
                }.tag(4)
                
                ProfileView().tabItem {
                    Image(systemName: "person.circle.fill")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("You")
                    
                }.tag(5)
            }
        }
}

#Preview {
    ContentView()
}
