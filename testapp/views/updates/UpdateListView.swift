//
//  UpdateListView.swift
//  testapp
//
//  Created by Chidume Nnamdi on 27/11/2023.
//

import SwiftUI

struct UpdateListView: View {
    @State private var statuses: [UserStatus] = []
    @EnvironmentObject var userData: UpdatesViewData
    @ObservedObject private var pollingManager = PollingManager<String>(pollingInterval: 90.0)
    var firestoreDataManager = FirestoreDataManager()

    var body: some View {
            VStack(alignment: .leading) {
                ForEach(statuses/*.indices, id: \.self*/) { status in
                    VStack(alignment: .leading) {
                        HStack {
                            BrokenCircleView(size: 55) {
                                if(status.statuses.last != nil) {
                                    LastStatusDisplayView(lastStatus: status.statuses.last!).onAppear(){
                                        print(status.statuses.last?.type)
                                    }
                                }
                            }
                            
                            VStack(alignment: .leading) {
                                Text("\(status.name)").bold()
                                Text("\(formatTimeAgo(status.time))").font(.system(size: 15))
                            }.padding(.leading, 4)
                            Spacer()
                        }
                        
                        Text("").padding(.bottom, 1)
                    }.onTapGesture {
                        userData.statusToView = status
                        userData.viewStatus = true
                    }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    
                    
                }
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).onAppear() {
                // statuses = generateMockTextUpdates(count: 100)
                firestoreDataManager.getDocuments(collection: "getStatuses", objectType: UserStatus.self) { result in
                    switch result {
                    case .success(let data):
                        statuses = data
                    case .failure(let error):
                        print("Error fetching data: \(error)")
                        // Handle the error as needed
                    }
                }
                pollingManager.startPolling {
                    // print("Started polling")
                    firestoreDataManager.getDocuments(collection: "getStatuses", objectType: UserStatus.self) { result in
                        switch result {
                        case .success(let data):
                            statuses = data
                        case .failure(let error):
                            print("Error fetching data: \(error)")
                            // Handle the error as needed
                        }
                    }
                }
            }
            .onDisappear() {
                pollingManager.stopPolling()
            }
        }
}

struct LastStatusDisplayView: View   {
    var lastStatus: Status;
    
    var body: some View {
        if(lastStatus.type == StatusType.text) {
            Text("\(lastStatus.content)")
        } else {
            RemoteImageView(imageURL: "\(lastStatus.mediaURL)", size: 55)
        }
    }
}

#Preview {
    UpdateListView()
}
