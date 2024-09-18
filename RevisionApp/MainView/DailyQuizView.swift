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
            VStack(alignment: .leading, spacing: 12) {
                Text("Test your iOS knowledge everyday with new questions!")
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
        .background(RadialGradient(colors: [.pink, .purple.opacity(0.5)], center: .leading, startRadius: 5, endRadius: 400))
        .cornerRadius(20)
        .shadow(radius: 2)
        .padding(.horizontal)
    }
}

#Preview {
    DailyQuizView()
}
