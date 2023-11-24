//
//  ChatsView.swift
//  testapp
//
//  Created by Chidume Nnamdi on 21/11/2023.
//

import SwiftUI

struct ProfileView: View {
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
  ]
    
    @State var text = ""

  var body: some View {
    List {
       SearchBar(text: $text)
        
      VStack(alignment: .center) {
          CircleAvatar(imageName: "").padding()
        Text("el extrano")
          .font(.system(size: 40))
          .bold()

        Text("el extrano")
          .font(.system(size: 20))

        HStack {
          VStack {
            Image(systemName: "person.crop.square.fill")
              .imageScale(.large)

            Text("Contacts")
          }
          .frame(width: 100)
          .padding(10)
          .border(Color.gray, width: 1)

          VStack {
            Image(systemName: "person.crop.circle")
              .imageScale(.large)

            Text("Profile")
          }
          .frame(width: 100)
          .padding(10)
          .border(Color.gray, width: 1)

        }
      }.frame(maxWidth: .infinity, alignment: .center)
        
            Section {
              HStack {
                Image(systemName: "star")
                      .foregroundColor(.yellow)
                  

                Text("Starred Messages")

              }.frame(height: 40)
              HStack {
                Image(systemName: "message")
                      .foregroundColor(.green)

                Text("Chats")

              }.frame(height: 40)
            }
            
            
        Section {

          HStack {
            Image(systemName: "key")
                  .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)

            Text("Accounts")

          }.frame(height: 40)
          HStack {
            Image(systemName: "info")
                  .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)

            Text("Help")

          }.frame(height: 40)
        }

    }
    .frame(maxWidth: .infinity)//.listStyle(PlainListStyle())

  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
  }
}

