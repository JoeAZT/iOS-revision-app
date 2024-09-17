//
//  File.swift
//  RevisionApp
//
//  Created by Joe Taylor on 01/09/2024.
//

import SwiftUI

struct MainButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .bold()
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity, minHeight: 160)
            .background(Color.black)
            .cornerRadius(20)
            .shadow(radius: 5, x: 5, y: 5)
            .padding(.horizontal)
    }
}

extension View {
    func customButtonStyle() -> some View {
        self.modifier(MainButtonStyle())
    }
}
