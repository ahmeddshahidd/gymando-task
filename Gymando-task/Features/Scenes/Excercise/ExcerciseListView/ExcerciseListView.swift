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
        List(viewModel.excercises.excercise) { excercise in
            Button(action: {
                tapOnExcerciseAction(excercise)
            }, label: {
                ExcerciseCell(excercise: excercise, viewModel: viewModel)
            })
        }
        .onAppear {
            viewModel.getExcercises()
        }
    }
}
