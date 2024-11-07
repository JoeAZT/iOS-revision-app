//
//  CategoryView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 07/11/2024.
//

import SwiftUI

struct CategoryView: View {
    
    var selectedCategory: String
    var viewModel: CatergoriesViewModel
    
    var body: some View {
        VStack {
            Text("we here now bro")
//            ForEach(viewModel.quizzes, id: \.self) { quiz in
//                VStack {
//                    Text(quiz)
//                }
//            }
        }
    }
}

#Preview {
    CategoryView(
        selectedCategory: "General",
        viewModel: CatergoriesViewModel(category: "General")
    )
}
