//
//  VariationExcerciseCell.swift
//  Gymando-task
//
//  Created by Ahmed Shahid on 21.04.22.
//

import SwiftUI
import SDWebImageSwiftUI

struct VariationExcerciseCell: View {
    
    let excercise: Excercise
    
    var body: some View {
        HStack(spacing: 10) {
            if let imageURL = excercise.getMainImage() {
                WebImage(url: URL(string: imageURL))
                    .placeholder(SwiftUI.Image("placeholder_image"))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .padding()
            } else {
                SwiftUI.Image("placeholder_image")
                    .resizable()
                    .scaledToFill()
                    .contentShape(Rectangle())
                    .clipped()
                    .frame(width: 20, height: 20)
                    .padding()
            }
            Text(excercise.name)
                .font(.body)
                .padding()
            
        }
    }
}
