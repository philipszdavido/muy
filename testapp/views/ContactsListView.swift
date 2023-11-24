import SwiftUI
import Contacts

//func requestContactsAccess(completion: @escaping (Bool) -> Void) {
//    let store = CNContactStore()
//
//    // Request access to contacts
//    store.requestAccess(for: .contacts) { (granted, error) in
//        DispatchQueue.main.async {
//            completion(granted)
//        }
//    }
//}
//
//func fetchContacts(completion: @escaping ([CNContact]?) -> Void) {
//    requestContactsAccess { (granted) in
//        if granted {
//            let keysToFetch = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
//            let request = CNContactFetchRequest(keysToFetch: keysToFetch as [CNKeyDescriptor])
//
//            var contacts = [CNContact]()
//
//            do {
//                try CNContactStore().enumerateContacts(with: request) { (contact, _) in
//                    contacts.append(contact)
//                }
//
//                DispatchQueue.main.async {
//                    completion(contacts)
//                }
//            } catch {
//                print("Error fetching contacts: \(error)")
//                DispatchQueue.main.async {
//                    completion(nil)
//                }
//            }
//        } else {
//            print("Contacts access not granted.")
//            DispatchQueue.main.async {
//                completion(nil)
//            }
//        }
//    }
//}

struct ContactsListView: View {
    @State private var contacts: [CNContact]?

    var body: some View {
        NavigationView{
        VStack {
            if let contacts = contacts {
                List(contacts, id: \.identifier) { contact in
                    HStack {
                        CircleAvatar(imageName: "", size: 35)
                        VStack(alignment: .leading) {
                            Text("\(contact.givenName) \(contact.familyName)")
                                .font(.headline)
                            if let phoneNumber = contact.phoneNumbers.first?.value.stringValue {
                                Text("\(phoneNumber)")
                                    .font(.subheadline)
                            }
                        }
                    }
                }
            } else {
                Text("Loading contacts...")
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("Contacts")
        }
        .onAppear {
            fetchContacts { fetchedContacts in
                contacts = fetchedContacts
            }
        }
    }

    func fetchContacts(completion: @escaping ([CNContact]) -> Void) {
        // Mock implementation with sample contacts
        let mockContacts: [CNContact] = [
            createMockContact(givenName: "John", familyName: "Doe", phoneNumber: "123-456-7890"),
            createMockContact(givenName: "Jane", familyName: "Smith", phoneNumber: "987-654-3210"),
            createMockContact(givenName: "Jane", familyName: "Smith", phoneNumber: "987-654-3210")
            ,
            createMockContact(givenName: "Jane", familyName: "Smith", phoneNumber: "987-654-3210")
            ,
            createMockContact(givenName: "Jane", familyName: "Smith", phoneNumber: "987-654-3210")
            ,
            createMockContact(givenName: "Jane", familyName: "Smith", phoneNumber: "987-654-3210")
            ,
            createMockContact(givenName: "Jane", familyName: "Smith", phoneNumber: "987-654-3210")

            // Add more mock contacts as needed
        ]

        completion(mockContacts)
    }

    func createMockContact(givenName: String, familyName: String, phoneNumber: String) -> CNContact {
        let contact = CNMutableContact()
        contact.givenName = givenName
        contact.familyName = familyName

        let phoneValue = CNPhoneNumber(stringValue: phoneNumber)
        let phoneNumber = CNLabeledValue(label: CNLabelPhoneNumberMain, value: phoneValue)
        contact.phoneNumbers = [phoneNumber]

        return contact.copy() as! CNContact
    }
}

struct ContactsListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsListView()
    }
}
