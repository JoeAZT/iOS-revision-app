//
//  ProfileStatView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 17/09/2024.
//

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
    }
}

#Preview {
    ProfileStatView(statValue: 4310, statName: "Quizzes")
}
