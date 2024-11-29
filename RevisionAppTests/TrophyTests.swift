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
        
        XCTAssertEqual(trophyColorProvider.trophyColor(for: 100), CommodityColor.gold, "Expected gold color for 100%")
        XCTAssertEqual(trophyColorProvider.trophyColor(for: 90), CommodityColor.silver, "Expected silver color for 90%")
        XCTAssertEqual(trophyColorProvider.trophyColor(for: 80), CommodityColor.bronze, "Expected bronze color for 80%")
        XCTAssertEqual(trophyColorProvider.trophyColor(for: 50), CommodityColor.standard, "Expected gold color for 100%")
    }
}
