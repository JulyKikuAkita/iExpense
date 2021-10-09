//
//  ContentView.swift
//  iExpense
//
//  Created by Ifang Lee on 10/5/21.
//

import SwiftUI

struct User: Codable {
    var firstName: String
    var lastName: String
}

struct ContentView: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    @State private var user = UserDefaults.standard.object(forKey: "UserData") as? User ?? User(firstName: "Noodles", lastName: "Lee")

    var body: some View {
        VStack {
            Button("Tap count: \(tapCount)") {
                tapCount += 1
                UserDefaults.standard.set(tapCount, forKey: "Tap")
            }

            Button("Save User: \(user.firstName) \(user.lastName)") {
                let encoder = JSONEncoder()
                if let data = try? encoder.encode(user) {
                    UserDefaults.standard.set(data, forKey: "UserData")
                }
            }
        }
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
