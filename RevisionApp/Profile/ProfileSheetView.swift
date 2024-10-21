//
//  ProfileSheetView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 21/10/2024.
//

import SwiftUI

struct ProfileSheetView: View {

    var sheetType: SheetType
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 18) {
            Text("Feature coming soon 🚀")
                .font(.title2)
                .bold()
            switch sheetType {
                case .share:
                    Text("We're working on a way to share your profile with friends. Stay tuned!")
                case .friend:
                    Text("We're working on a way to add friends. Stay tuned!")
            }
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Okay")
                    .bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
            }
        }
        .padding(.horizontal, 40)
        .presentationDetents([.fraction(0.25)])
    }
}

enum SheetType {
    case share
    case friend
}

#Preview {
    ProfileSheetView(sheetType: .friend)
}
