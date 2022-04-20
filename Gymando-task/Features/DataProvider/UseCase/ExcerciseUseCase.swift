//
//  ExcerciseUseCase.swift
//  Gymando-task
//
//  Created by Ahmed Shahid on 20.04.22.
//

import Foundation
import Combine

protocol ExcerciseUseCase {
    func getExcerciseList() -> Future<ExcercisePage, Error>
    func getExcercise(with id: Int) -> Future<Excercise, Error>
}
