//
//  Untitled.swift
//  RevisionApp
//
//  Created by Joe Taylor on 14/11/2024.
//

@testable import RevisionApp
import SnapshotTesting
import SwiftUI
import XCTest

final class ContentViewTests: XCTestCase {
    
    private func getView() -> some View {
        QuizMenuView(
            viewModel: MainViewModel(
                router: MockRouter(),
                quizLoader: JSONQuizLoader(),
                trophyColorProvider: DefaultTrophyColorProvider(),
                scoreManger: ScoreManager()
            )
        )
    }
    
    func testContentViewSnapShot() {
        let view = getView()
        assertSnapshot(of: view, as: .image)
    }
}
