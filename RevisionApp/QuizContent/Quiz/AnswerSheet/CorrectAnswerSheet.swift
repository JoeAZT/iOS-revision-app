//
//  CorrectAnswerSheet.swift
//  RevisionApp
//
//  Created by Joe Taylor on 04/09/2024.
//

import SwiftUI

struct CorrectAnswerSheet: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("You are correct 🎉")
                .font(.title2)
                .bold()
        }
    }
}

#Preview {
    CorrectAnswerSheet()
}
