//
//  QuizCarouselView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 18/09/2024.
//

import SwiftUI

struct QuizCarouselView: View {
    var body: some View {
        VStack {
            Image(systemName: "iphone.gen2")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .padding()
                .background(.red)
                .cornerRadius(10)
            Text("Quiz category")
        }
        
    }
}

#Preview {
    QuizCarouselView()
}
