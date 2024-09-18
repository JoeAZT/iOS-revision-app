//
//  QuizCarouselView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 18/09/2024.
//

import SwiftUI

struct QuizCarouselView: View {
    var quizzess: [String]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(quizzess, id: \.self) { quiz in
                    VStack {
                        Image(systemName: "iphone.gen2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .padding()
                            .background(RadialGradient(colors: [.red, .orange], center: .bottomLeading, startRadius: 40, endRadius: 200))
                            .cornerRadius(20)
                            .shadow(radius: 3)
                        Text(quiz)
                    }
                }
            }
        }
    }
}

#Preview {
    QuizCarouselView(quizzess: ["Combine", "SwiftUI", "General Knowledge", "Architecture"])
}


