//
//  QuizCarouselView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 18/09/2024.
//

import SwiftUI

struct QuizCarouselView: View {
    
    var viewModel: QuizCarouselViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Array(zip(viewModel.quizzess.indices, viewModel.quizzess)), id: \.1) { index, quiz in
                    VStack {
                        //Change for circle stroke graphic for progress
                        Image(systemName: "iphone.gen2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: viewModel.getGradientColors(for: index)), startPoint: .topLeading, endPoint: .bottomTrailing))
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
}


