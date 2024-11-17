//
//  DailyQuizView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 17/09/2024.
//

import SwiftUI

struct BannerView: View {
    
    var isDailyQuiz: Bool = true
    var viewModel: MainViewModel
    var quiz: String
    
    var body: some View {
        
        Button {
            viewModel.didTapNavigateToQuiz(selectedQuiz: quiz)
        } label: {
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text(isDailyQuiz == true ? "Test your iOS knowledge everyday with new questions!" : "Fix your previous mistakes and fill any gaps in your knowledge")
                        .multilineTextAlignment(.leading)
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text(isDailyQuiz == true ? "Start quiz" : "Show me the questions")
                        .font(.subheadline)
                        .bold()
                        .padding(8)
                        .padding(.horizontal, 6)
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
                Spacer()
            }
            .padding()
            .foregroundColor(.white)
            .background(isDailyQuiz == true ? RadialGradient(colors: [.pink, .purple], center: .leading, startRadius: 5, endRadius: 400) : RadialGradient(colors: [.black.opacity(0.5), .green], center: .leading, startRadius: 5, endRadius: 400))
            .cornerRadius(20)
            .shadow(radius: 4, x: 2, y: 2)
            .padding(.horizontal)
        }
    }
}

#Preview {
    BannerView(viewModel: MainViewModel(
        router: Router(),
        quizLoader: JSONQuizLoader(),
        trophyColorProvider: DefaultTrophyColorProvider(),
        scoreManger: ScoreManager()
    ),
               quiz: "Daily Quiz"
    )
}
