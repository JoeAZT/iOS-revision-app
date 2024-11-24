//
//  QuizCarouselCellView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 24/11/2024.
//
import SwiftUI

struct QuizCarouselCellView: View {
    
    let categoryName: String
    
    var body: some View {
        VStack {
            Circle()
                .stroke(lineWidth: 5)
                .foregroundColor(.offwhite)
                .frame(width: 60, height: 60)
            Text(categoryName)
                .padding(.top, 12)
        }
        .padding()
        .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.offwhite, lineWidth: 4)
            )
        .padding(.vertical, 10)
    }
}

#Preview {
    QuizCarouselCellView(categoryName: "Category name here")
}
