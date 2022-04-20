//
//  ExcerciseListViewModel.swift
//  Gymando-task
//
//  Created by Ahmed Shahid on 20.04.22.
//

import Foundation

class ExcerciseViewModel: ObservableObject {
    
    private let excerciseUseCase: ExcerciseUseCase
    @Published var excercises: ExcercisePage
    
    init(excerciseUseCase: ExcerciseUseCase) {
        self.excerciseUseCase = excerciseUseCase
        self.excercises = ExcercisePage(count: nil, next: nil, previous: nil, excercise: [])
    }
    
    func getExcercises() {
        self.excerciseUseCase.getExcerciseList()
            .replaceError(with: ExcercisePage(count: nil, next: nil, previous: nil, excercise: []))
            .assign(to: &$excercises)
    }
    
    func getMainImageURL(from excercise: Excercise) -> String? {
        if excercise.images != nil && excercise.images!.count > 0 {
            guard let index = excercise.images?.firstIndex(where: { $0.isMain == true }) else { return nil }
            return excercise.images?[index].image
        }
        return nil
    }
    
}
