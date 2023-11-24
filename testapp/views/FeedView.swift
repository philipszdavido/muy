//
//  ChatsView.swift
//  testapp
//
//  Created by Chidume Nnamdi on 21/11/2023.
//

import SwiftUI

struct Feed: Identifiable {
    let name: String
    let id = UUID()
}

struct FeedView: View {
    
    private var feeds = [
        Feed(name: "Pacific"),
        Feed(name: "Pacific"),
        Feed(name: "Pacific"),
        Feed(name: "Pacific"),
        Feed(name: "Pacific"),
        Feed(name: "Pacific"),
    ]
    
    @State private var username: String = "Hello"
    
    var body: some View {
        NavigationView {
            FeedList(feeds: feeds)
            .navigationTitle("Feed")
            .toolbar {
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
                            Image(systemName: "camera")
                        }
                    }
                }
                
            }
        }
    }
}

struct FeedList: View {
    var feeds: Array<Feed>
    
    var body: some View {
        List(feeds.indices, id: \.self) { index in
            Section {
                HStack(alignment: .top) {
                    CircleAvatar(imageName: "", size: 30)
                    VStack(alignment: .leading) {
                        Text("Ben").bold().padding(.bottom, 2)
                        FeedBodyView()
                    }.padding(.leading, 3)
                }
            }
        }.listStyle(PlainListStyle())
    }
}

struct FeedBodyView: View {
    var body: some View {
        VStack {
            Text("We are still passing the text binding to TextField . Before the custom binding change takes effect, we will need to make one more change. Modify the parameter in TextField and make sure you pass the searchText as the binding")
            
            Section {
                    HStack(){
                        Spacer()
                        Image(systemName: "heart").font(.system(size: 30))
                        Text("1K")
                        
                        Image(systemName: "hand.thumbsup").font(.system(size: 30))
                        Text("100")

                    }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }.padding(.top)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
