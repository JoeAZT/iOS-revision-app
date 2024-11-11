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
            HStack(spacing: 20) {
                ForEach(Array(zip(viewModel.categories.indices, viewModel.categories)), id: \.1) { index, categoryName in
                        Button {
                            viewModel.didTapNavigateToCategoryView(selectedCategory: viewModel.selectedCategory)
                        } label: {
                            VStack {
                            Circle()
                                .stroke(lineWidth: 5)
                                .foregroundColor(.black)
                                .frame(width: 60, height: 60)
                                .padding()
                                .background(.white)
                                .cornerRadius(20)
                            Text(categoryName)
                        }
                    }
                }
            }
            .padding(.leading, 20)
        }
        .frame(height: 120)
        .padding(.top, 10)
    }
}
