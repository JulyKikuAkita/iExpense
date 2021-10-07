//
//  ContentView.swift
//  iExpense
//
//  Created by Ifang Lee on 10/5/21.
//
// Use the object for multiple views
// Steps:
// 1. Make a class that conforms to the ObservableObject protocol.
// 2. Mark some properties with @Published so that any views using the class get updated when they change.
// 3. Create an instance of our class using the @ObservedObject property wrapper.

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Noodles"
    @Published var lastName = "Lee"
}

struct ContentView: View {
    @ObservedObject var user = User()

    var body: some View {
        VStack(alignment: .center){
            Text("Your name is \(user.firstName) \(user.lastName).")

            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
