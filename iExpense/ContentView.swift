//
//  ContentView.swift
//  iExpense
//
//  Created by Ifang Lee on 10/5/21.
//

import SwiftUI

struct User {
    var firstName = "Noodles"
    var lastName = "Lee"
}

struct ContentView: View {
    @State private var user = User()

    var body: some View {
        VStack{
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
