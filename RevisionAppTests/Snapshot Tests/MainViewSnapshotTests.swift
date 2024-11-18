//
//  QuizMenuViewTests.swift
//  RevisionApp
//
//  Created by Joe Taylor on 14/11/2024.
//

@testable import RevisionApp
import SnapshotTesting
import SwiftUI
import XCTest

final class QuizMenuViewTests: XCTestCase {
    
    private func getView() -> some View {
        QuizMenuView(
            viewModel: MainViewModel(
                router: MockRouter(),
                quizLoader: MockQuizLoader(),
                trophyColorProvider: DefaultTrophyColorProvider(),
                scoreManger: ScoreManager()
            )
        )
    }
    
    func testQuizMenuViewSnapShot() {
        let view = getView()
        assertSnapshot(of: view, as: .image)
    }
}
