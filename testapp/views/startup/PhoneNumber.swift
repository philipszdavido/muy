//
//  PhoneNumber.swift
//  testapp
//
//  Created by Chidume Nnamdi on 25/11/2023.
//

import SwiftUI

//struct PhoneNumber: View {
//
//    @State private var phoneNumber = ""
//    @State private var country: Country = Country(id: "", country: "United States", region: "north america")
//
//    var body: some View {
//
//        NavigationView {
//            VStack(alignment: .leading) {
//                HStack {
//                    Spacer()
//                    Text("Your Phone Number")
//                        .foregroundColor(.primary)
//                        .font(.headline)
//                    Spacer()
//                    
//                    Text("Done")
//                        .foregroundColor(  phoneNumber.isEmpty ? .gray : .blue).onTapGesture {
//                        savePerson(Person(name: "user", phoneNumber: self.phoneNumber))
//
//                    }
//                    
//                }.padding(9)
//                Divider().padding(.bottom)
//
//                Text("Please confirm your country code and enter your phone number").multilineTextAlignment(.center).padding()
//                
//                VStack(alignment: .leading) {
//                    NavigationLink(
//                        destination: CountriesCodesView( selectedCountry: $country)) {
//                            Text("United States")
//                        }
//                    Divider()
//                    HStack {
//                        Text("+1").font(.system(size: 20))
//                        TextField("Enter Phone Number", text: $phoneNumber)
//                                .padding()
//                            .keyboardType(.phonePad)
//                    }
//                }.background().padding()
//                Spacer()
//
//            }
//        }.background(.opacity(0.5))
//    }
//}

struct User: Codable {
    let name: String;
    let phone_number: String
}

struct PhoneNumber: View {
    @State private var phoneNumber = "87665545"
    @State private var country: Country = Country(name: "United States", dial_code: "+1", code: "US")
    @State private var isShowingCountriesView = false
    @State private var progress = false
    @State private var showMain = false
    
    var firestore = FirestoreDataManager()

    var body: some View {
            if showMain == false {
                NavigationView {
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        Text("Your Phone Number")
                            .foregroundColor(.primary)
                            .font(.headline)
                        Spacer()
                        
                        if progress {
                            ProgressView().padding(.trailing, 2)
                        } else { Text("Done")
                                .foregroundColor(phoneNumber.isEmpty ? .gray : .blue)
                                .onTapGesture {
                                    self.progress = true
                                    firestore.addDocument(collection: "users", data: User(name: "user", phone_number: country.dial_code + phoneNumber)) {
                                        error in
                                        if let error = error {
                                            print("Failed to add document: \(error)")
                                        } else {
                                            print("Document added successfully!")
                                            savePerson(Person(name: "user", phoneNumber: country.dial_code + phoneNumber))
                                            progress = false
                                            showMain = true
                                        }
                                    }
                                    
                                }
                        }
                    }
                    .padding(9)
                    Divider().padding(.bottom)

                    Text("Please confirm your country code and enter your phone number").multilineTextAlignment(.center).padding()

                    VStack(alignment: .leading) {
                        Button(action: {
                            isShowingCountriesView.toggle()
                        }) {
                            Text(country.name)
                        }
                        .sheet(isPresented: $isShowingCountriesView) {
                            CountriesCodesView(selectedCountry: $country) { tappedCountry in
                                country = tappedCountry
                                isShowingCountriesView = false
                            }
                        }

                        Divider()

                        HStack {
                            Text("\(country.dial_code)").font(.system(size: 20))
                            TextField("Enter Phone Number", text: $phoneNumber)
                                .padding()
                                .keyboardType(.phonePad)
                        }
                    }
                    .background()
                    .padding()

                    Spacer()
                }
                }
            } else {
                ContentView()
            }
        }
        //.background(.opacity(0.5))
    
}

#Preview {
    PhoneNumber()
}
