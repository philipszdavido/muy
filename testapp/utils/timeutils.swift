//
//  time.utils.swift
//  testapp
//
//  Created by Chidume Nnamdi on 19/12/2023.
//

import Foundation

func formatTimeAgo(_ dateString: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // Adjust the date format based on your string
    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // Adjust the locale if needed

    if let date = dateFormatter.date(from: dateString) {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: date, relativeTo: Date())
    } else {
        // Handle the case where the string couldn't be converted to a date
        return "Invalid Date"
    }
}
