//
//  chat.mocks.swift
//  testapp
//
//  Created by Chidume Nnamdi on 22/11/2023.
//

import Foundation


func generateMockChatItem() -> ChatItem {
    let names = ["Alice", "Bob", "Charlie", "David", "Eva"]
    let randomName = names.randomElement() ?? "Unknown"

    let messages = ["Hello!", "How are you?", "Nice to meet you.", "What's up?", "See you later!"]
    let randomMessage = messages.randomElement() ?? "Default Message"

    let randomTimestamp = Date().addingTimeInterval(-Double.random(in: 0...(60 * 60 * 24 * 7))) // Within the last week

    let profileImages = ["profile1", "profile2", "profile3"]
    let randomProfileImage = profileImages.randomElement() ?? "defaultProfile"

    let randomIsRead = Bool.random()

    let randomMessageType: MessageType = Bool.random() ? .text : .image

    return ChatItem(
        name: randomName,
        message: randomMessage,
        timestamp: randomTimestamp,
        profileImage: randomProfileImage,
        isRead: randomIsRead,
        messageType: randomMessageType
    )
}

func generateMockChatItems(count: Int) -> [ChatItem] {
    var mockChatItems: [ChatItem] = []

    for _ in 0..<count {
        let names = ["Alice", "Bob", "Charlie", "David", "Eva"]
        let randomName = names.randomElement() ?? "Unknown"

        let messages = ["Hello!", "How are you?", "Nice to meet you.", "What's up?", "See you later!"]
        let randomMessage = messages.randomElement() ?? "Default Message"

        let randomTimestamp = Date().addingTimeInterval(-Double.random(in: 0...(60 * 60 * 24 * 7))) // Within the last week

        let profileImages = ["profile1", "profile2", "profile3"]
        let randomProfileImage = profileImages.randomElement() ?? "defaultProfile"

        let randomIsRead = Bool.random()

        let randomMessageType: MessageType = Bool.random() ? .text : .image

        let mockChatItem = ChatItem(
            name: randomName,
            message: randomMessage,
            timestamp: randomTimestamp,
            profileImage: randomProfileImage,
            isRead: randomIsRead,
            messageType: randomMessageType
        )

        mockChatItems.append(mockChatItem)
    }

    return mockChatItems
}

func generateMockMessages(count: Int) -> [MessageItem] {
    var mockChatItems: [MessageItem] = []

    for _ in 0..<count {
        let names = ["Alice", "Bob", "Charlie", "David", "Eva"]
        let randomName = names.randomElement() ?? "Unknown"

        let messages = ["Hello!", "How are you?", "Nice to meet you.", "What's up?", "See you later!"]
        let randomMessage = messages.randomElement() ?? "Default Message"

        let randomTimestamp = Date().addingTimeInterval(-Double.random(in: 0...(60 * 60 * 24 * 7))) // Within the last week

        let randomIsRead = Bool.random()

        let randomMessageType: MessageType = Bool.random() ? .text : .image

        let mockChatItem = MessageItem(
            message: randomMessage,
            timestamp: randomTimestamp,
            isRead: randomIsRead,
            messageType: randomMessageType
        )

        mockChatItems.append(mockChatItem)

    }
    
    return mockChatItems

}
