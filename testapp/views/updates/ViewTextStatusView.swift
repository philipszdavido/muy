//
//  ViewTextStatusView.swift
//  testapp
//
//  Created by Chidume Nnamdi on 27/11/2023.
//

import SwiftUI

struct ViewTextStatusView: View {
    var status: UserStatus
    
    @State private var currentIndex = 0
    @State private var curentStatusToView: any Status?
    @State private var timer: Timer? = nil
    @EnvironmentObject var userData: UpdatesViewData

    var body: some View {
            VStack() {
                if let curentStatusToView = curentStatusToView {
                    HeaderStatusView(status: status)
                    MainStatusView(status: curentStatusToView).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                    BottomStatusView(status: curentStatusToView)
                }
            }
            .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .onAppear {
                curentStatusToView = status.statuses[currentIndex]
                timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
                    withAnimation {
                        
                        let total = status.statuses.count
                        currentIndex = currentIndex + 1
                        if currentIndex >= total {
                            self.timer?.invalidate()
                        } else {
                            curentStatusToView = status.statuses[currentIndex]
                        }
                        
                    }
                }
            }
            .onDisappear(perform: {
                userData.viewStatus = false
                userData.statusToView = nil

                timer?.invalidate()
            })
            .background()
            
       
    }
}

struct MainStatusView: View {
    var status: Status
    
    var body: some View {
        if status.type == StatusType.text {
            VStack {
                Text("\(status.content)")
                    .bold()
            }
        } else if status.type == StatusType.image {
            AsyncImage(url: URL(string: status.mediaURL))
                .background(.blue)
                .ignoresSafeArea()
        } else if status.type == StatusType.video {
            VideoPlayerView(videoURL: URL(string: status.mediaURL)!)
        }
            
    }
}

struct HeaderStatusView: View {
    var status: UserStatus
    @EnvironmentObject var userData: UpdatesViewData

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ForEach(status.statuses) { status in
                    LinearViewUpdateProgressView().frame(height: 2)
                }
            }.padding(2)
            HStack {
                Image(systemName: "chevron.left")
                    .bold()
                    .onTapGesture {
                    userData.viewStatus = false
                    userData.statusToView = nil
                }
                RemoteImageView(imageURL: "", size: 55)
                VStack(alignment: .leading) {
                    Text("Me")
                    Text("7:09AM")
                }
            }
        }.padding(4)
        
    }
}


struct BottomStatusView: View {
    var status: Status
    @State private var sheetShow = false;
    
    var body: some View {
        VStack() {
            Text("\(status.caption)")
                .bold()
            
            Rectangle()
                .frame(height: 1)
            
            Image(systemName: "chevron.up")
                .bold()
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            
            HStack(alignment: .center) {
                Image(systemName: "eye").bold()
                Text("\(status.noOfViews)")
            }.onTapGesture {
                sheetShow = true
            }.sheet(isPresented: $sheetShow, content: {
                List {
                    Text("Hi")
                }
            })
        }.padding(3)
    }
}

#Preview {
    ViewTextStatusView(status: generateAMockUpdate())
}
