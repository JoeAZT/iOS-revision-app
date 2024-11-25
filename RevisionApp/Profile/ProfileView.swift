//
//  ProfileView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 17/09/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @State var presentFriendSheet: Bool = false
    @State var presentShareSheet: Bool = false
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.black)
                        VStack(alignment: .leading) {
                            Text("Joe")
                                .font(.title2)
                                .bold()
                            Text("@joeazt")
                                .font(.subheadline)
                                .opacity(0.8)
                        }
                        Spacer()
                    }
                    
                    HStack {
                        Button {
                            presentFriendSheet.toggle()
                        } label: {
                            HStack {
                                Text("Add friends")
                                    .bold()
                                Image(systemName: "person.fill.badge.plus")
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(20)
                        }
                        .sheet(isPresented: $presentFriendSheet) {
                            ProfileSheetView(sheetType: .friend)
                        }
                        
                        Button {
                            presentShareSheet.toggle()
                        } label: {
                            HStack {
                                Text("Share")
                                Image(systemName: "square.and.arrow.up")
                            }
                            .bold()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.black)
                            .cornerRadius(20)
                        }
                        .sheet(isPresented: $presentShareSheet) {
                            ProfileSheetView(sheetType: .share)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Stats")
                            .font(.title2)
                            .bold()
                        HStack {
                            ProfileStatView(statValue: 1234, statName: "Plays")
                            Spacer()
                            ProfileStatView(statValue: 78, statName: "Average %")
                        }
                        
                        HStack {
                            ProfileStatView(statValue: 137, statName: "Gold")
                            Spacer()
                            ProfileStatView(statValue: 324, statName: "Silver")
                        }
                    }
                    .padding(.top, 12)
                    
                    VStack(alignment: .leading) {
                        Text("Friends Leaderboard")
                            .font(.title2)
                            .bold()
                        
                        let users = (0..<5).map { _ in
                            (
                                name: "User \(Int.random(in: 1000...9999))",
                                score: Int.random(in: 0...1000),
                                symbol: ["chevron.up", "minus", "chevron.down"].randomElement()!
                            )
                        }
                            .sorted { $0.score > $1.score }
                        
                        ForEach(users, id: \.name) { user in
                            HStack {
                                Image(systemName: user.symbol)
                                    .foregroundColor(symbolColor(for: user.symbol))
                                    .bold()
                                //add the users position in the scoreboard here
                                Text(1)
                                    .bold()
                                Circle()
                                    .frame(height: 30)
                                Text(user.name)
                                Spacer()
                                HStack(spacing: 2) {
                                    Text("\(user.score)")
                                        .bold()
                                    Text("points")
                                        .opacity(0.8)
                                }
                            }
                            .padding()
                            .padding(.vertical, 8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.offwhite, lineWidth: 4)
                            )
                        }
                    }
                    .padding(.top, 12)
                    
                    VStack(alignment: .leading) {
                        Text("History")
                            .font(.title2)
                            .bold()
                        ForEach(0..<7) { _ in
                            HStack {
                                Text("🧠")
                                    .padding(12)
                                    .background(CommodityColor.gold.linearGradient)
                                    .cornerRadius(12)
                                Text("Quiz")
                                Spacer()
                                HStack(spacing: 2) {
                                    Text("100")
                                        .bold()
                                    Text("points")
                                        .opacity(0.8)
                                }
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(CommodityColor.gold.linearGradient, lineWidth: 4)
                            )
                        }
                    }
                    .padding(.top, 12)
                }
                
                .padding()
                .navigationTitle("Profile")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            
                        } label: {
                            Image(systemName: "gear")
                                .foregroundColor(.secondaryGrey)
                        }
                    }
                }
            }
        }
    }
}

private func symbolColor(for symbol: String) -> Color {
        switch symbol {
        case "chevron.up":
            return .correct
        case "minus":
            return .offwhite // Replace with your "offwhite" color
        case "chevron.down":
            return .incorrect
        default:
            return .primary
        }
    }

#Preview {
    ProfileView()
}
