//
//  DailyQuizView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 17/09/2024.
//

import SwiftUI

struct BannerView: View {
    
    var isDailyQuiz: Bool
    var viewModel: MainViewModel
    var quiz: String
    
    var body: some View {
        
        Button {
            viewModel.didTapNavigateToQuiz(selectedQuiz: quiz)
        } label: {
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    Text(isDailyQuiz == true ? "Suggested" : "Just for you")
                        .opacity(0.8)
                    Text(isDailyQuiz == true ? "Test your iOS knowledge everyday with new questions!" : "Fix your previous mistakes and fill any gaps in your knowledge")
                        .multilineTextAlignment(.leading)
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text(isDailyQuiz == true ? "Start quiz" : "Show me the questions")
                        .font(.subheadline)
                        .padding(20)
                        .padding(.horizontal, 12)
                        .foregroundColor(.white)
                        .background(.appBlack)
                        .cornerRadius(20)
                }
                Spacer()
            }
            .padding()
            .foregroundColor(isDailyQuiz == true ? .white : .appBlack)
            .background(
                ZStack {
                    MeshGradient(
                        width: 2,
                        height: 2,
                        points: [[0, 0], [1, 0], [0, 1], [1, 1]],
                        colors: isDailyQuiz == true ?
                        [.indigo.opacity(0.8), .blue.opacity(0.5), .purple.opacity(0.5), .purple.opacity(0.5)]
                        :
                            [Color.offwhite, Color.offwhite, Color.offwhite, Color.offwhite]
                    )
                }
            )
            .cornerRadius(20)
            .padding(.horizontal)
        }
    }
}

#Preview {
    BannerView(
        isDailyQuiz: true,
        viewModel: MainViewModel(
            router: Router(),
            quizLoader: JSONQuizLoader(),
            quizCellHelper: QuizCellHelper(
                trophyColorProvider: DefaultTrophyColorProvider(),
                scoreManger: ScoreManager()
            )
        ),
        quiz: "Daily Quiz"
    )
    BannerView(
        isDailyQuiz: false,
        viewModel: MainViewModel(
            router: Router(),
            quizLoader: JSONQuizLoader(),
            quizCellHelper: QuizCellHelper(
                trophyColorProvider: DefaultTrophyColorProvider(),
                scoreManger: ScoreManager()
            )
        ),
        quiz: "Daily Quiz"
    )
}
