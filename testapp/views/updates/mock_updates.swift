//
//  mock_updates.swift
//  testapp
//
//  Created by Chidume Nnamdi on 27/11/2023.
//

import Foundation

func generateAMockUpdate() -> UserStatus {
    var names = ["KCee", "Nne", "Pedi", "Kingsley", "Astia", "Chineneye", "Kosi", "Uche", "CJ"]

    return UserStatus(
        id: UUID().uuidString,
        name: names.randomElement() ?? "",
        imageURL: "https://avatars.githubusercontent.com/u/25048922?v=4",
        statuses: generateStatus(count: 9),
        noOfStatus: 9,
        time: ""//Date().addingTimeInterval(-Double.random(in: 0...(60 * 60 * 24 * 7)))
    )
}

func generateMockTextUpdates(count: Int) -> [UserStatus] {
    var userStatuses:[UserStatus] = []
    
    var names = ["KCee", "Nne", "Pedi", "Kingsley", "Astia", "Chineneye", "Kosi", "Uche", "CJ"]
    
    var noOfStatuses = 10

    for _ in 0..<count {
        let user = UserStatus(
            id: UUID().uuidString,
            name: names.randomElement() ?? "",
            imageURL: "https://avatars.githubusercontent.com/u/25048922?v=4",
            statuses: generateStatus(count: noOfStatuses),
            noOfStatus: noOfStatuses,
            time: ""//Date().addingTimeInterval(-Double.random(in: 0...(60 * 60 * 24 * 7)))
        )
        
        userStatuses.append(user)
    }
    
    return userStatuses
    
}


func generateStatus(count: Int) -> [Status] {
    var status:[Status] = []
    
    let captions = ["Come on!!", "Hey there", "Au revoir"]
    
    for _ in 0..<count {
        var mediaURL = ""
        var ty = StatusType.allCases.randomElement()
        
        if ty == .image {
            mediaURL = "https://avatars.githubusercontent.com/u/25048922?v=4"
        } else if ty == .video {
            mediaURL = "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
        }
        
        let s = Status(
            id: UUID().uuidString,
            type: ty!,
            mediaURL: mediaURL,
            caption: captions.randomElement()!,
            noOfViews: 90,
            content: "Yeah man, it is me"
        )
        
        status.append(s)
    }
    
    return status
}

// http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4

func getStatusType(id: Int) -> StatusType {
    let statusType: StatusType
    
    switch id % 3 {
        case 0:
            statusType = .text
        case 1:
            statusType = .image
        case 2:
            statusType = .video
        default:
            statusType = .text
        }
    return statusType
}
