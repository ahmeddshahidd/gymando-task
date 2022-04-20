//
//  NetworkExcerciseUseCase.swift
//  Gymando-task
//
//  Created by Ahmed Shahid on 20.04.22.
//

import Foundation
import Combine

final class NetworkExcerciseUseCase {
    var networkClient: NetworkProvider = NetworkClient.instance
}

extension NetworkExcerciseUseCase: ExcerciseUseCase {
    func getExcerciseList() -> Future<ExcercisePage, Error> {
        networkClient.performOperation(request: ExcerciseRouter.excercises.asURLRequest(), response: ExcercisePage.self)
    }
    
    func getExcercise(with id: Int) -> Future<Excercise, Error> {
        networkClient.performOperation(request: ExcerciseRouter.excercise(id: id).asURLRequest(), response: Excercise.self)
    }
}
