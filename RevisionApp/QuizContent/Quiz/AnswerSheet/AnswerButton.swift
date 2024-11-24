//
//  AnswerButton.swift
//  RevisionApp
//
//  Created by Joe Taylor on 13/08/2024.
//

import SwiftUI

struct AnswerButton: ViewModifier {
    
    func body(content: Content) -> some View {
            content
                .foregroundColor(.white)
                .font(.title2)
                .multilineTextAlignment(.leading)
                .padding()
                .background(.appBlack)
                .clipShape(.rect(cornerRadius: 10))
    }
}
