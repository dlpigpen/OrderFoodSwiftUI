//
//  ContentView.swift
//  SwiftUITest
//
//  Created by ducnguyen on 8/26/23.
//
//
import SwiftUI
//
struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { item in
                            NavigationLink {
                                ItemDetail(item: item)
                            } label : {
                                ItemRow(menuItem: item)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelDta())
    }
}
