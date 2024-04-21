//
//  Welcome.swift
//  testapp
//
//  Created by Chidume Nnamdi on 25/11/2023.
//

import SwiftUI

struct Welcome: View {
    @State private var phoneNumberViewPresented = false
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                Image(systemName: "message")
                    .font(.system(size: 100))
                    .frame(maxHeight: 190)
                
                VStack {
                    Text("Tap 'Agree & Continue' to accept the Terms and Conditions")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 19))
                    
                    Text("").padding(3)
                    Button("Agree & Continue") {
                        self.phoneNumberViewPresented = true
                    }
                    
                }.padding()
                
                Spacer()
            }
            
            if phoneNumberViewPresented {
                PhoneNumber()
            }
        }

    }
}

#Preview {
    Welcome()
}
