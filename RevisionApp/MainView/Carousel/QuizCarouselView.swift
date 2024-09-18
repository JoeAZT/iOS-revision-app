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
                        Circle()
                            .stroke(lineWidth: 5)
                            .foregroundColor(.pink.opacity(0.8))
                            .frame(width: 60, height: 60)
                            .padding()
                            .background(.thinMaterial)
                            .cornerRadius(20)
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


