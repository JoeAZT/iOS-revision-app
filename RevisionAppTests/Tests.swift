//
//  Tests.swift
//  RevisionApp
//
//  Created by Joe Taylor on 25/09/2024.
//

import XCTest
import Combine
@testable import RevisionApp
import SwiftUI

class MainViewModelTests: XCTestCase {
    
    func makeSUT() -> MainViewModel {
        MainViewModel(router: RouterMock(), quizzes)
    }

    func testTrophyUIBronze(userScoreAsPercentage: Double) {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.trophyColor(for: userScoreAsPercentage), Color("bronze"))
    }
    
}


class RouterMock: RouterProtocol {
    var stack: [Route] = []

    func push(to route: Route) {
        stack.append(route)
    }

    func pop() {
        guard !stack.isEmpty else { return }
        stack.removeLast()
    }

    func popToRootView() {
        stack.removeAll()
    }
}
