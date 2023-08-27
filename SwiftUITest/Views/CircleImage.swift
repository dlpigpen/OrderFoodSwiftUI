//
//  CircleImage.swift
//  SwiftUITest
//
//  Created by ducnguyen on 8/26/23.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.gray, lineWidth: 4)
            }
    }
}

struct CicleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("car"))
    }
}
