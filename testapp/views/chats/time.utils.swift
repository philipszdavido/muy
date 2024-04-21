//
//  time.utils.swift
//  testapp
//
//  Created by Chidume Nnamdi on 22/11/2023.
//

import Foundation

func timeAgoString(from timestamp: Date) -> String {
    let currentDate = Date()
    let calendar = Calendar.current

    let components = calendar.dateComponents([.second, .minute, .hour, .day, .weekOfMonth, .month, .year], from: timestamp, to: currentDate)

    if let years = components.year, years > 0 {
        return "\(years) year\(years == 1 ? "" : "s")"
    } else if let months = components.month, months > 0 {
        return "\(months) month\(months == 1 ? "" : "s")"
    } else if let weeks = components.weekOfMonth, weeks > 0 {
        return "\(weeks) week\(weeks == 1 ? "" : "s")"
    } else if let days = components.day, days > 0 {
        return "\(days) day\(days == 1 ? "" : "s")"
    } else if let hours = components.hour, hours > 0 {
        return "\(hours) hour\(hours == 1 ? "" : "s")"
    } else if let minutes = components.minute, minutes > 0 {
        return "\(minutes) minute\(minutes == 1 ? "" : "s")"
    } else if let seconds = components.second, seconds > 0 {
        return "\(seconds) second\(seconds == 1 ? "" : "s")"
    } else {
        return "just now"
    }
}

// Example usage:
// let timestamp = Date().addingTimeInterval(-3600) // One hour ago
//let timeAgo = timeAgoString(from: timestamp)
//print(timeAgo)

