//
//  DailyQuizView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 17/09/2024.
//

import SwiftUI

struct DailyQuizView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Daily quiz")
                    .font(.title)
                    .bold()
                Text("Test your general iOS knowledge")
                    .font(.subheadline)
                Text("Start now")
                    .font(.headline)
                    .bold()
                    .padding(8)
                    .padding(.horizontal, 6)
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(30)
            }
            .padding()
            Spacer()
            Image(systemName: "questionmark.bubble.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .padding()
        }
        .padding()
        .background(.white)
        .cornerRadius(20)
        .shadow(radius: 2)
        .padding()
    }
}

#Preview {
    DailyQuizView()
}
