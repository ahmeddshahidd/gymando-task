//
//  ExcerciseListView.swift
//  Gymando-task
//
//  Created by Ahmed Shahid on 20.04.22.
//

import SwiftUI

struct ExcerciseListView: View {
    @StateObject var viewModel = ExcerciseViewModel(excerciseUseCase: NetworkExcerciseUseCase())
    let tapOnExcerciseAction: (Excercise) -> Void
    
    var body: some View {
        List(viewModel.excercisePage.excercise) { excercise in
            Button(action: {
                tapOnExcerciseAction(excercise)
            }, label: {
                ExcerciseCell(excercise: excercise)
            })
        }
        .onAppear {
            viewModel.getExcercises()
        }
        
    }
}
