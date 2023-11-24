//
//  ChatsView.swift
//  testapp
//
//  Created by Chidume Nnamdi on 21/11/2023.
//

import SwiftUI

struct Ocean: Identifiable {
    let name: String
    let id = UUID()
}

private var oceans = [
    Ocean(name: "Pacific"),
    Ocean(name: "Atlantic"),
    Ocean(name: "Indian"),
    Ocean(name: "Southern"),
    Ocean(name: "Arctic"),
    Ocean(name: "Southern"),
    Ocean(name: "Southern"),
    Ocean(name: "Southern"),
]

struct UpdatesView: View {
    
    @State var textUpdate = true
    @State private var videoUpdate = false
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                        SearchBar(text: .constant(""))
                        
                    
                            VStack {
                                HStack {
                                    Text("Status")
                                        .padding(.leading)
                                        .bold()
                                        .font(.system(size: 25))
                                    
                                    Spacer()
                                    
                                    Menu {
                                        Section("") {
                                            Button("Text") { 
                                                textUpdate = true
                                            }
                                            Button("Camera") { 
                                                videoUpdate = true
                                            }
                                        }
                                    } label: {
                                        Label("", systemImage: "plus").padding(.trailing)
                                    }

                                }.padding(.top, 26.0)

                                HStack {
                                    HStack{
                                    CircleAvatar(imageName: "", size: 50)
                                    
                                    VStack(alignment: .leading) {
                                        Text("My Status").bold()
                                            .font(.system(size: 17))
                                        Text("13h ago")
                                    }
                                    Spacer()
                                    }.padding()
                                }.background()
                            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        

                    VStack(alignment: .leading) {
                        Text("").padding(1)
                        HStack {
                            Text("").padding(2)
                            Text("RECENT UPDATES").font(.system(size: 15))
                        }
                        VStack(alignment: .leading) {

                            HStack {
                                
                                VStack {
                                    ForEach(oceans.indices, id: \.self) { index in
                                        VStack {
                                            HStack(alignment: .center) {
                                                CircleAvatar(imageName: "user", size: 55)
                                                VStack(alignment: .leading) {
                                                    Text("KCee").bold()
                                                    Text("2hours ago").font(.system(size: 15))
                                                }.padding(.leading, 4)
                                            }
                                            Text("").padding(.bottom, 1)
                                        }
                                    }
                                }
                                Spacer()
                            }.padding(10)
                        }
                        .frame(maxWidth: .infinity)
                        .background() // Add your desired background color

                        
                    }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    
                    
                }.navigationTitle("Updates")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            HStack {
                                Menu {
                                    Section("") {
                                        Button("Text") {
                                            textUpdate = true
                                        }
                                        Button("Camera") { videoUpdate = true }
                                    }
                                } label: {
                                    Label("Menu", systemImage: "ellipsis.circle")
                                }
                              
                               
                                
                            }
                        }
                        
                    }
            }
            
            if textUpdate {
                TextUpdateView(textUpdate: $textUpdate)
            }
            
            if videoUpdate {
                NavigationView {
                    Text("Video Update")
                }
            }
        }
        
    }
}

struct UpdatesView_Previews: PreviewProvider {
    static var previews: some View {
        UpdatesView()
    }
}


struct SearchBar: View {
  @Binding var text: String
  @State private var isEditing = false
  var body: some View {
    HStack {
      TextField("Search ...", text: $text)
        .padding(7)
        .padding(.horizontal, 25)
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .overlay(
          HStack {
            Image(systemName: "magnifyingglass")
              .foregroundColor(.gray)
              .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
              .padding(.leading, 8)
            if isEditing {
              Button(action: {
                self.text = ""
              }) {
                Image(systemName: "multiply.circle.fill")
                  .foregroundColor(.gray)
                  .padding(.trailing, 8)
              }
            }
          }
        )
        .padding(.horizontal, 10)
        .onTapGesture {
          self.isEditing = true
        }
      if isEditing {
        Button(action: {
          self.isEditing = false
          self.text = ""
        }) {
          Text("Cancel")
        }
        .padding(.trailing, 10)
        .transition(.move(edge: .trailing))
        .animation(.default)
      }
    }
  }
}


