//
//  TabView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 18/09/2024.
//

import SwiftUI

struct TabViewInnt: View {
    
    // State to track the selected tab
    @State private var selectedTab: Tab = .quizMenu
    
    // Enum for tabs
    enum Tab {
        case quizMenu
        case profile
    }
    
    var body: some View {
        TabView {
            QuizMenuView(viewModel: MainViewModel(router: Router()))
                .tabItem {
                    Label("Quizzes", systemImage: "questionmark.circle")
                }
                .tag(Tab.quizMenu)
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
                .tag(Tab.profile)
        }
    }
}

#Preview {
    TabViewInnt()
}
