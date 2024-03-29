//
//  LandmarkRow.swift
//  SwiftUITest
//
//  Created by ducnguyen on 8/27/23.
//

import Foundation
import SwiftUI

struct LandmarkRow: View {
    var landMark: Landmark

    var body: some View {
       HStack {
        landMark.image
            .resizable()
            .frame(width: 50, height: 50)
        Text(landMark.name)
        Spacer()
           if (landMark.isFavorite) {
               Image(systemName: "star.fill")
                   .foregroundColor(.yellow)
           }
       }
    }
}

struct LandmarkRowPreviews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landMark: ModelDta().landmarks[0])
            LandmarkRow(landMark: ModelDta().landmarks[1])
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
