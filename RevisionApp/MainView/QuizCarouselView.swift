//
//  QuizCarouselView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 18/09/2024.
//

import SwiftUI

struct QuizCarouselView: View {
    var colors: [Color] = [.red, .pink, .purple, .blue, .green, .yellow, .orange]
    var quizzess: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Array(zip(quizzess.indices, quizzess)), id: \.1) { index, quiz in
                    VStack {
                        Image(systemName: "iphone.gen2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: getGradientColors(for: index)), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .cornerRadius(20)
                            .shadow(radius: 3)
                        Text(quiz)
                    }
                    .padding(.trailing, 10)
                }
            }
            .padding(.leading, 20)
        }
        .frame(height: 120)
        .padding(.top, 10)
    }
    
    private func getGradientColors(for index: Int) -> [Color] {
        let colorCount = colors.count
        let firstColor = colors[index % colorCount]
        let secondColor = colors[(index + 1) % colorCount]
        return [firstColor, secondColor]
    }
}


