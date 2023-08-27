//
//  OrderView.swift
//  SwiftUITest
//
//  Created by ducnguyen on 8/27/23.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.items, id: \.self) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                
                Section {
                    NavigationLink("Place Order") {
                        CheckoutView()
                    }
                }
                .disabled(order.items.isEmpty)
            }
            .navigationTitle("Order")
            .toolbar {
                EditButton()
            }
        }
        .onAppear() {
            print("order", order.items.count)
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject( { () -> Order in
            let order = Order()
            order.add(item: MenuItem.example)
            return order
        }())
    }
}
