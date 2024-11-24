//
//  ProfileStatView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 17/09/2024.
//

import SwiftUI

import SwiftUI

struct ProfileStatView: View {
    var statValue: Int
    var statName: String
    
    var body: some View {
        VStack {
            Text("\(statValue)")
                .font(.title2)
                .bold()
            Text(statName)
                .opacity(0.75)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

#Preview {
    ProfileStatView(statValue: 4310, statName: "Quizzes")
}
