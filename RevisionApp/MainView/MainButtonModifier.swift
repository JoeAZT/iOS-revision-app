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
            .foregroundColor(.black)
            .padding()
            .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 100)
            .background(Color.white)
            .cornerRadius(20)
            .padding(.horizontal)
    }
}

extension View {
    func customButtonStyle() -> some View {
        self.modifier(MainButtonStyle())
    }
}
