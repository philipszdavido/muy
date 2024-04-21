//
//  testappApp.swift
//  testapp
//
//  Created by Chidume Nnamdi on 21/11/2023.
//

import SwiftUI
import Foundation

// Your custom object
struct Person: Codable {
    var name: String
    var phoneNumber: String
}

// Save a custom object to UserDefaults
func savePerson(_ person: Person) {
    let encoder = JSONEncoder()
    if let encodedData = try? encoder.encode(person) {
        UserDefaults.standard.set(encodedData, forKey: "savedPerson")
    }
}

// Retrieve a custom object from UserDefaults
func loadPerson() -> Person? {
    if let savedData = UserDefaults.standard.data(forKey: "savedPerson"),
       let loadedPerson = try? JSONDecoder().decode(Person.self, from: savedData) {
        return loadedPerson
    }
    return nil
}

@main
struct testappApp: App {
    var body: some Scene {
        WindowGroup {
            if let loadedPerson = loadPerson() {
                ContentView()
            } else {
              Welcome()
            }
        }
    }
}
