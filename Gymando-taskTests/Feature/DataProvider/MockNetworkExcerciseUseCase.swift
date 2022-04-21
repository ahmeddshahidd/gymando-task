//
//  MockNetworkExcerciseUseCase.swift
//  Gymando-taskTests
//
//  Created by Ahmed Shahid on 21.04.22.
//

import Foundation
import Combine

@testable import Gymando_task

final class MockNetworkExcerciseUseCase {
    var networkClient: NetworkProvider = TestUtils.mockNetworkClient(file: "excercisePage.json")
}

extension MockNetworkExcerciseUseCase: ExcerciseUseCase {
    func getExcerciseList() -> Future<ExcercisePage, Error> {
        networkClient.performOperation(request: ExcerciseRouter.excercises.asURLRequest(), response: ExcercisePage.self)
    }
    
    func getExcercise(with id: Int) -> Future<Excercise, Error> {
        networkClient.performOperation(request: ExcerciseRouter.excercise(id: id).asURLRequest(), response: Excercise.self)
    }
}
