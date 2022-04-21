//
//  Gymando_taskTests.swift
//  Gymando-taskTests
//
//  Created by Ahmed Shahid on 20.04.22.
//

import XCTest
import Combine
@testable import Gymando_task

class Gymando_taskTests: XCTestCase {
    
    // An example of network provider testing
    func testExcerciseNetworkProviderGetExcercisePage() {
        let exp = expectation(description: "Parse repos success")
        var subscriptions = Set<AnyCancellable>()
        
        let networkClient = TestUtils.mockNetworkClient(file: "excercisePage.json")
        let excerciseUseCase = NetworkExcerciseUseCase()
        excerciseUseCase.networkClient = networkClient
        
        excerciseUseCase.getExcerciseList().sink { _ in } receiveValue: { excercisePage in
            let firstExcercise = excercisePage.excercise.first
            let isCorrectParsing = firstExcercise?.id != nil && firstExcercise?.name != nil
            
            XCTAssert(isCorrectParsing)
            
            exp.fulfill()
        }.store(in: &subscriptions)

        wait(for: [exp], timeout: 0.5)
    }
    
//    // An example of view model testing
//    func testForkedRepoTextInRepoDetailsViewModel() {
//        
//        var repo = Repo()
//        
//        var sourceRepo = Repo()
//        sourceRepo.fullName = "sourceOwnerName/SourceRepo"
//        repo.source = Container(value: sourceRepo)
//        
//        let viewModel = RepoDetailsViewModel()
//        viewModel.repo = repo
//        XCTAssertEqual(viewModel.forkText, "Forked from \(sourceRepo.fullName ?? "")")
//    }
    
}
