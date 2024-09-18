//
//  DailyQuizView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 17/09/2024.
//

import SwiftUI

struct DailyQuizBannerView: View {
    
    var viewModel: MainViewModel
    var quiz = "Daily Quiz"
    
    var body: some View {
        
        Button {
            viewModel.didTapNavigateToQuiz(selectedQuiz: quiz)
        } label: {
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Test your iOS knowledge everyday with new questions!")
                        .multilineTextAlignment(.leading)
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("Start now")
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
            .background(RadialGradient(colors: [.pink, .purple], center: .leading, startRadius: 5, endRadius: 400))
            .cornerRadius(20)
            .shadow(radius: 2)
            .padding(.horizontal)
        }
    }
}

#Preview {
    DailyQuizBannerView(viewModel: MainViewModel(router: Router()))
}
