//
//  ExcerciseDetailView.swift
//  Gymando-task
//
//  Created by Ahmed Shahid on 21.04.22.
//

import SwiftUI
import SDWebImageSwiftUI

struct ExcerciseDetailView: View {
    
    @StateObject var viewModel: ExcerciseDetailViewModel
    
    let tapOnVariation: (_ excercise: Excercise) -> Void
    
    var body: some View {
        VStack {
            if let images = viewModel.excercise?.images, images.count > 0 {
                GeometryReader { geometry in
                    ImageCarouselView(numberOfImages: images.count) {
                        ForEach(0..<images.count) { index in
                            WebImage(url: URL(string: images[index].image))
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width, height:geometry.size.height)
                                .clipped()
                        }
                    }
                }.frame(height: 300, alignment: .center)
            }
            Text(viewModel.excerciseName ?? "")
                .font(.title)
            if viewModel.showVariations == true && (viewModel.excercise?.variations?.count ?? 0) > 0 {
                    Text("Variations")
                        .font(.headline)
                if let variationExcercises = viewModel.variationExcercise, variationExcercises.count > 0 {
                        List(variationExcercises) { excercise in
                            Button(action: {
                                print("variation tap: \(excercise.name)")
                                tapOnVariation(excercise)
                            }, label: {
                                VariationExcerciseCell(excercise: excercise)
                            })
                        }
                    }
            }
            Spacer()
        }.padding()
        
    }
}
