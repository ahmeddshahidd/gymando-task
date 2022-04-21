//
//  ExcerciseListViewModel_Test.swift
//  Gymando-taskTests
//
//  Created by Ahmed Shahid on 21.04.22.
//

import XCTest
@testable import Gymando_task

class ExcerciseListViewModel_Test: XCTestCase {
    
    func testExcerciseListViewModelGetExcercise() {
        let networkUseCase = MockNetworkExcerciseUseCase(networkProvider: TestUtils.mockNetworkClient(file: "excercisePage.json"))
        let viewModel = ExcerciseViewModel(excerciseUseCase: networkUseCase)
        
        viewModel.getExcercises()
        XCTAssertEqual(viewModel.excercisePage.excercise.count, 20)
        XCTAssertNil(viewModel.excercisePage.excercise[0].getMainImage())
        XCTAssertNotNil(viewModel.excercisePage.excercise[6].getMainImage())
        XCTAssertEqual(viewModel.excercisePage.excercise[6].getMainImage(), "https://wger.de/media/exercise-images/113/Walking-lunges-1.png")
    }
    
}
