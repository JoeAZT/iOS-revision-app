//
//  ProfileView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 17/09/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)
                Text("Username")
                    .font(.title2)
                    .bold()
                Spacer()
            }
            HStack {
                Text("Average Score: 78%")
            }
            
            HStack {
                ProfileStatView(statValue: 1234, statName: "Plays")
                Spacer()
                ProfileStatView(statValue: 56, statName: "Gold")
                Spacer()
                ProfileStatView(statValue: 324, statName: "Silver")
            }
            .frame(width: .infinity)
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
