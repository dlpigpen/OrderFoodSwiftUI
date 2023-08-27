//
//  SwiftUITestApp.swift
//  SwiftUITest
//
//  Created by ducnguyen on 8/26/23.
//

import SwiftUI

@main
struct SwiftUITestApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
