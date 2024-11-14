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
                router: Router(),
                quizzes: ["snapshot quiz 1", "snapshot quiz 2", "snapshot quiz 3"],
                categories: ["snapshot category 1", "snapshot category 2", "snapshot category 3"])
        )
        
    }
    
    func testContentViewSnapShot() {
        let view = getView()
        assertSnapshot(of: view, as: .image)
    }
}
