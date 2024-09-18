//
//  QuizCarouselViewModel.swift
//  RevisionApp
//
//  Created by Joe Taylor on 18/09/2024.
//

import Foundation
import SwiftUI

struct QuizCarouselViewModel {
    
    var quizzess: [String]
    var colors: [Color] = [.pink, .pink.opacity(0.5), .purple, .purple.opacity(0.5), .blue, .blue.opacity(0.5)]
    
    func getGradientColors(for index: Int) -> [Color] {
        let colorCount = colors.count
        let firstColor = colors[index % colorCount]
        let secondColor = colors[(index + 1) % colorCount]
        return [firstColor, secondColor]
    }
}
