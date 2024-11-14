
//  Tests.swift
//  RevisionApp
//
//  Created by Joe Taylor on 25/09/2024.


import XCTest
import Combine
@testable import RevisionApp
import SwiftUI

class MainViewModelTests: XCTestCase {
    
    func makeSUT() -> MainViewModel {
        MainViewModel(
            router: RouterMock(),
            quizzes: ["snapshot quiz 1", "snapshot quiz 2", "snapshot quiz 3"],
            categories: ["snapshot category 1", "snapshot category 2", "snapshot category 3"]
        )
    }

    func testTrophyUIBelow() {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.trophyColor(for: 69), .gray.opacity(0.75))
    }
    
    func testTrophyUIBronze() {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.trophyColor(for: 70), Color("bronze"))
    }
    
    func testTrophyUISilver() {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.trophyColor(for: 90), Color("silver"))
    }
    
    func testTrophyUIGold() {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.trophyColor(for: 100), Color("gold"))
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
