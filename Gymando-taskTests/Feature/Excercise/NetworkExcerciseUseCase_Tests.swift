//
//  NetworkExcerciseUseCase_Tests.swift
//  Gymando-taskTests
//
//  Created by Ahmed Shahid on 21.04.22.
//

import XCTest
@testable import Gymando_task

class NetworkExcerciseUseCase_Tests: XCTestCase {
    
    func testNetworkExcerciseUseCaseGetExcercisePage() {
         
        let networkUseCase = MockNetworkExcerciseUseCase()
        let expectation = self.expectation(description: "GetExcercisePage")
        
        networkUseCase.getExcerciseList().sink { _ in } receiveValue: { excercisePage in
            // ASSERT
            XCTAssertNotNil(excercisePage)
            XCTAssertEqual(excercisePage.excercise.count, 20)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.5)
    }
    
    func testNetworkExcerciseUseCaseGetExcercise() {
         
        let networkUseCase = MockNetworkExcerciseUseCase()
        networkUseCase.networkClient = TestUtils.mockNetworkClient(file: "excercise.json")
        
        let expectation = self.expectation(description: "GetExcercise")
        
        networkUseCase.getExcercise(with: 5).sink(receiveCompletion: { _ in }) { excercise in
            // ASSERT
            XCTAssertNotNil(excercise.images)
            XCTAssertNotNil(excercise.variations)
            XCTAssertEqual(excercise.images?.count, 4)
            XCTAssertEqual(excercise.variations?.count, 2)
            XCTAssertEqual(excercise.getMainImage(), "https://wger.de/media/exercise-images/113/Walking-lunges-1.png")
            XCTAssertEqual(excercise.name, "Ausfallschritte im Gehen")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.5)
    }
    
}
