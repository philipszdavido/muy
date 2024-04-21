//
//  updates_model.swift
//  testapp
//
//  Created by Chidume Nnamdi on 27/11/2023.
//

import Foundation

enum StatusType: String, CaseIterable, Decodable, Encodable {
    case text
    case image
    case video
}

class TextStatus: Status {
    
    var text: String
    var bgColor: String
    var fontFamily: String
    
    init(id: String, type: StatusType, mediaURL: String, caption: String, noOfViews: Int, content: String, text: String, bgColor: String, fontFamily: String) {
        self.text = text;
        self.bgColor = bgColor;
        self.fontFamily = fontFamily;
        super.init(id: id, type: type, mediaURL: mediaURL, caption: caption, noOfViews: noOfViews, content: content)
    }

    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}

class VideoStatus: Status {
    
    var mediaUrl: String
    
    init(id: String, type: StatusType, mediaURL: String, caption: String, noOfViews: Int, content: String, mediaUrl: String) {
            self.mediaUrl = mediaUrl
            super.init(id: id, type: type, mediaURL: mediaURL, caption: caption, noOfViews: noOfViews, content: content)
        }

    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
}

class ImageStatus: Status {

    let mediaUrl: String
        
    init(id: String, type: StatusType, mediaURL: String, caption: String, noOfViews: Int, content: String, mediaUrl: String) {
            self.mediaUrl = mediaUrl
            super.init(id: id, type: type, mediaURL: mediaURL, caption: caption, noOfViews: noOfViews, content: content)
        }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}

class Status: Identifiable, Codable {
    let id: String
    let type: StatusType
    let mediaURL: String
    let caption: String
    let noOfViews: Int
    let content: String
    
    init(id: String, type: StatusType, mediaURL: String, caption: String, noOfViews: Int, content: String) {
        self.id = id
        self.type = type
        self.mediaURL = mediaURL
        self.caption = caption
        self.noOfViews = noOfViews
        self.content = content
    }
}

struct UserStatus: Identifiable, Codable {
    let id: String
    let name: String
    let imageURL: String
    let statuses: [Status]
    let noOfStatus: Int
    let time: String
}
