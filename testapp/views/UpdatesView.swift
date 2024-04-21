//
//  ChatsView.swift
//  testapp
//
//  Created by Chidume Nnamdi on 21/11/2023.
//

import SwiftUI

class UpdatesViewData: ObservableObject {
    @Published var viewStatus = false
    @Published var statusToView: UserStatus?
}

struct UpdatesView: View {
    
    let updatesViewData = UpdatesViewData()

    var body: some View {
        ZStack {
            UpdatesMainView()
        }.environmentObject(updatesViewData)
        
    }
}

struct UpdatesMainView: View {
    @State var textUpdate = false
    @State private var videoUpdate = false
    @EnvironmentObject var _updatesViewData: UpdatesViewData
    @ObservedObject private var pollingManager = PollingManager<String>(pollingInterval: 2.0)

    var body: some View {
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
                        
                        MyUpdatesView()

                    }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                
                RecentUpdatesView()
                
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
        .onAppear {
                    pollingManager.startPolling {
                        
                    }
                }
                .onDisappear {
                    pollingManager.stopPolling()
                }
        
        if textUpdate {
            NavigationView {
                TextUpdateView(textUpdate: $textUpdate)
            }.toolbar(.hidden, for: .tabBar)
        }
        
        if videoUpdate {
            CameraView().toolbar(.hidden, for: .tabBar)
        }

        if _updatesViewData.viewStatus {
            ViewTextStatusView(status: _updatesViewData.statusToView!)
        }

    }
}

struct RecentUpdatesView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("").padding(1)
            HStack {
                Text("").padding(2)
                Text("RECENT UPDATES").font(.system(size: 15))
            }
            VStack(alignment: .leading) {

                HStack {
                    UpdateListView()

                    Spacer()
                }.padding(10)
            }
            //.frame(maxWidth: .infinity)
            
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    }
}

struct MyUpdatesView: View {
    var body: some View {
        HStack {
            HStack{
                NavigationLink(destination: MyPersonalStatusListView()) {
                    BrokenCircleView(size: 55) {
                        CircleAvatar(imageName: "", size: 50)
                    }
                }
            
            VStack(alignment: .leading) {
                Text("My Status").bold()
                    .font(.system(size: 17))
                Text("13h ago")
            }
            Spacer()
            }.padding()
        }.background()
    }
}

struct UpdatesView_Previews: PreviewProvider {
    static var previews: some View {
        UpdatesView()
    }
}
