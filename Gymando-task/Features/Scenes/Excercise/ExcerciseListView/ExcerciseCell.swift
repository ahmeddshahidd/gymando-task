//
//  ExcerciseCell.swift
//  Gymando-task
//
//  Created by Ahmed Shahid on 20.04.22.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct ExcerciseCell: View {
    
    let excercise: Excercise
    let viewModel: ExcerciseViewModel
    
    var body: some View {
        HStack(spacing: 10) {
            if let imageURL = viewModel.getMainImageURL(from: excercise) {
                WebImage(url: URL(string: imageURL))
                    .placeholder(SwiftUI.Image("placeholder_image"))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .padding()
            } else {
                SwiftUI.Image("placeholder_image")
                    .resizable()
                    .scaledToFill()
                    .contentShape(Rectangle())
                    .clipped()
                    .frame(width: 50, height: 50)
                    .padding()
            }
            
            Text(excercise.name)
                .font(.body)
                .padding()
            
        }
    }
}
