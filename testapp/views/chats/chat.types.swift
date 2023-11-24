//
//  chat.types.swift
//  testapp
//
//  Created by Chidume Nnamdi on 22/11/2023.
//

import Foundation

struct ChatItem: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var message: String
    var timestamp: Date
     var profileImage: String
     var isRead: Bool
     var messageType: MessageType

    init(name: String, message: String, timestamp: Date, profileImage: String, isRead: Bool, messageType: MessageType) {
        self.name = name
        self.message = message
        self.timestamp = timestamp
        self.profileImage = profileImage
        self.isRead = isRead
        self.messageType = messageType
    }
}

enum MessageType {
    case text
    case image
}

struct MessageItem: Identifiable {
    var id = UUID()
    var message: String
    var timestamp: Date
     var isRead: Bool
     var messageType: MessageType

    init(message: String, timestamp:Date, isRead: Bool, messageType: MessageType) {
        self.message = message
        self.timestamp = timestamp
        self.isRead = isRead
        self.messageType = messageType
    }
}

