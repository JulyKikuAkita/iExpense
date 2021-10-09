//
//  ContentView.swift
//  iExpense
//
//  Created by Ifang Lee on 10/5/21.
//

import SwiftUI

struct ExpenseItem: Codable {
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}

struct ContentView: View {
    @ObservedObject var expenses = Expenses()

    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .navigationBarItems(trailing:
                Button(action: {
                    let expense = ExpenseItem(name: "Test", type: "A", amount: 10)
                    expenses.items.append(expense)
                }) {
                    Image(systemName: "plus")
                }
            )
        }
    }

    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
