//
//  ExcerciseCoordinator.swift
//  Gymando-task
//
//  Created by Ahmed Shahid on 20.04.22.
//

import SwiftUI

struct ExcerciseListCoordinator: View {
    
    @State private var selectedExcercise: Excercise?
    @State private var selectedVariationExcercise: Excercise?
    
    var body: some View {
            VStack {
                ExcerciseListView(tapOnExcerciseAction: { excercise in
                    selectedExcercise = excercise
                })
                    .listStyle(PlainListStyle())
                    .navigationTitle("Excercises")
                
                if let selectedExcercise = selectedExcercise {
                    let excerciseDetailViewModel = self.generateExcerciseDetailViewModel(excercise: selectedExcercise, showVariations: true)
                    EmptyNavigationLink(destination: ExcerciseDetailView(viewModel: excerciseDetailViewModel, tapOnVariation: { excercise in
                        selectedVariationExcercise = excercise
                    }), selectedItem: $selectedExcercise)
                }
                
                if let selectedVariationExcercise = selectedVariationExcercise {
                        let excerciseDetailViewModel = self.generateExcerciseDetailViewModel(excercise: selectedVariationExcercise, showVariations: false)
                    EmptyNavigationLink(destination: ExcerciseDetailView(viewModel: excerciseDetailViewModel, tapOnVariation: {_ in}), selectedItem: $selectedVariationExcercise)
                    
                }
            }
    }
    
    private func generateExcerciseDetailViewModel(excercise: Excercise, showVariations: Bool) -> ExcerciseDetailViewModel {
        return ExcerciseDetailViewModel(excerciseUseCase: NetworkExcerciseUseCase(), excercise: excercise, showVariations: showVariations)
    }
}
