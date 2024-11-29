//
//  QuizCarouselView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 18/09/2024.
//

import SwiftUI

struct QuizCarouselView: View {
    @StateObject var viewModel: QuizCarouselViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                if viewModel.hasCategories {
                    ForEach(viewModel.categoryData, id: \.0) { index, categoryName in
                        Button {
                            viewModel.didTapNavigateToCategoryView(selectedCategory: categoryName)
                        } label: {
                            QuizCarouselCellView(categoryName: categoryName)
                        }
                    }
                } else {
                    Text(viewModel.noDataMessage)
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding(.top, 20)
                }
            }
            .padding(.leading, 20)
        }
        .padding(.top, 10)
    }
}
