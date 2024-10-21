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
                            VStack {
                                Text("Feature coming soon")
                                    .font(.title2)
                                    .bold()
                                Text("We're working on a way to add friends. Stay tuned!")
                                Button {
                                    presentFriendSheet.toggle()
                                } label: {
                                    Text("Okay")
                                        .bold()
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(.black)
                                        .cornerRadius(10)
                                        .frame(maxWidth: .infinity)
                                }
                            }
                            .padding(.horizontal, 32)
                            .presentationDetents([.fraction(0.2)])
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
                            VStack {
                                Text("Feature coming soon")
                                    .font(.title2)
                                    .bold()
                                Text("We're working on a way to share your profile with friends. Stay tuned!")
                                Button {
                                    presentShareSheet.toggle()
                                } label: {
                                    Text("Okay")
                                        .bold()
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(.black)
                                        .cornerRadius(10)
                                        .frame(maxWidth: .infinity)
                                }
                            }
                            .padding(.horizontal, 32)
                            .presentationDetents([.fraction(0.2)])
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
                        Text("History")
                            .font(.title2)
                            .bold()
                        ForEach(0..<7) { _ in
                            HStack {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.black)
                                VStack(alignment: .leading) {
                                    Text("Joe")
                                        .font(.title3)
                                        .bold()
                                    Text("Played 3 days ago")
                                        .font(.subheadline)
                                        .opacity(0.8)
                                }
                                Spacer()
                                Text("\(Int.random(in: 3...10)*10)%")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.black)
                            }
                            .padding(.vertical, 8)
                        }
                    }
                    .padding(.top, 12)
                }
                .padding()
                .navigationTitle("Profile")
            }
        }
    }
}


#Preview {
    ProfileView()
}
