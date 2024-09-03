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
            .background(Color.black)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2)
            )
            .shadow(radius: 5, x: 5, y: 5)
    }
}

extension View {
    func customButtonStyle() -> some View {
        self.modifier(MainButtonStyle())
    }
}
