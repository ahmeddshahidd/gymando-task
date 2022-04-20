//
//  ExcerciseDetailViewModel.swift
//  Gymando-task
//
//  Created by Ahmed Shahid on 21.04.22.
//

import Foundation
import Combine

class ExcerciseDetailViewModel: ObservableObject {
    
    @Published var excercise: Excercise?
    @Published var variationExcercise: [Excercise]? = nil
    @Published var excerciseName: String?
    @Published var showVariations: Bool = true
    
    private let excerciseUseCase: ExcerciseUseCase
    private var cancellables = Set<AnyCancellable>()
    
    init(excerciseUseCase: ExcerciseUseCase, excercise: Excercise, showVariations: Bool) {
        self.excerciseUseCase = excerciseUseCase
        self.excercise = excercise
        self.showVariations = showVariations
        self.setup()
    }
    
    private func setup() {
        self.bind()
        self.fetchVariations()
    }
    
    private func bind() {
        $excercise.map({$0?.name}).assign(to: &$excerciseName)
    }
    
    private func fetchVariations() {
        guard let variations = self.excercise?.variations else { return }
        let group = DispatchGroup()
        var variationExcercise: [Excercise] = []
        for variationID in variations {
            group.enter()
            self.excerciseUseCase.getExcercise(with: variationID).sink { completion in
                switch completion {
                case .failure(let err):
                    print("Error is \(err.localizedDescription)")
                case .finished:
                    print("Finished")
                }
            } receiveValue: { excercise in
                variationExcercise.append(excercise)
                group.leave()
            }
            .store(in: &cancellables)
        }
        group.notify(queue: .main) {
            self.variationExcercise = variationExcercise
        }
    }
}
