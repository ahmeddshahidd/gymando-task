//
//  ExcerciseListViewModel.swift
//  Gymando-task
//
//  Created by Ahmed Shahid on 20.04.22.
//

import Foundation

class ExcerciseViewModel: ObservableObject {
    
    private let excerciseUseCase: ExcerciseUseCase
    @Published var excercisePage: ExcercisePage
    
    
    init(excerciseUseCase: ExcerciseUseCase) {
        self.excerciseUseCase = excerciseUseCase
        self.excercisePage = ExcercisePage(count: nil, next: nil, previous: nil, excercise: [])
    }
    
    func getExcercises() {
        self.excerciseUseCase.getExcerciseList()
            .replaceError(with: ExcercisePage(count: nil, next: nil, previous: nil, excercise: []))
            .assign(to: &$excercisePage)
    }
}
