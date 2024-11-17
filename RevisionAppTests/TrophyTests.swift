//
//  TrophyTests.swift
//  RevisionApp
//
//  Created by Joe Taylor on 14/11/2024.
//

import SwiftUI
import XCTest
@testable import RevisionApp

class TrophyColorProviderTests: XCTestCase {
    
    func testTrophyColor() {
        let trophyColorProvider = DefaultTrophyColorProvider()
        
        XCTAssertEqual(trophyColorProvider.trophyColor(for: 100), Color("gold"), "Expected gold color for 100%")
        XCTAssertEqual(trophyColorProvider.trophyColor(for: 95), Color("silver"), "Expected silver color for 95%")
        XCTAssertEqual(trophyColorProvider.trophyColor(for: 80), Color("bronze"), "Expected bronze color for 80%")
        XCTAssertEqual(trophyColorProvider.trophyColor(for: 50), .gray.opacity(0.75), "Expected gray color for <70%")
    }
}
