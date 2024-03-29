//
//  ItemRow.swift
//  SwiftUITest
//
//  Created by ducnguyen on 8/27/23.
//

import SwiftUI

struct ItemRow: View {
    let menuItem: MenuItem
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    var body: some View {
        HStack{
            Image(menuItem.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke( .gray, lineWidth: 2))
            VStack(alignment: .leading) {
                Text(menuItem.name)
                    .font(.headline)
                Text("$\(menuItem.price)")
            }
            
            Spacer()
            
            ForEach(menuItem.restrictions, id: \.self) { restriction in
                
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(colors[restriction,  default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
                
            }
           
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(menuItem: MenuItem.example)
    }
}
