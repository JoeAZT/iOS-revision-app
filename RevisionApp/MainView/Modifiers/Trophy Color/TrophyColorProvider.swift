//
//  TrophyColorProvider.swift
//  RevisionApp
//
//  Created by Joe Taylor on 14/11/2024.
//

import SwiftUI

protocol TrophyColorProvider {
    func trophyColor(for percentage: Int) -> Color
}

class DefaultTrophyColorProvider: TrophyColorProvider {
    func trophyColor(for percentage: Int) -> Color {
        switch percentage {
        case 100:
            return Color("gold")
        case 90..<100:
            return Color("silver")
        case 70..<90:
            return Color("bronze")
        default:
            return .gray.opacity(0.75)
        }
    }
}
