//
//  CheckoutView.swift
//  SwiftUITest
//
//  Created by ducnguyen on 8/27/23.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State private var paymentType = "Cash"
    @State private var addLoyalltyDetail = false
    @State private var loyaltyNumber = ""
    
    let tipAmounts = [10,15,20,25,30, 0]
    @State private var tipAmount = 15
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    
    @State private var showingPaymentAlert = false
    
    
    let paymentTypes = ["Cash", "Credit Card", "MD Payment"]
    var body: some View {
        Form {
            Section {
                Picker("How do you want to play?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                Toggle("Add MD loyalty card", isOn: $addLoyalltyDetail.animation())
                if (addLoyalltyDetail){
                    TextField("Enter your MD ID ", text: $loyaltyNumber)
                }
                    
            }
            
            Section("Add a tip") {
                Picker("Percentage: ", selection: $tipAmount) {
                    ForEach(tipAmounts, id:  \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Total: \(totalPrice)") {
                Button("Confirm Order") {
                    showingPaymentAlert.toggle()
                }
                .alert("Order confirmed", isPresented: $showingPaymentAlert) {
                    
                } message: {
                    Text("Your total was \(totalPrice) - thank you")
                }

            }
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject( { () -> Order in
            let order = Order()
            order.add(item: MenuItem.example)
            return order
        }())
    }
}
