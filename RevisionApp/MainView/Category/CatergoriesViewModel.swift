//
//  CatergoriesViewModel.swift
//  RevisionApp
//
//  Created by Joe Taylor on 07/11/2024.
//

import Foundation

class CatergoriesViewModel: ObservableObject {
    
    var category: String = ""
    let quizzes: [String]
    
    init(
        category: String,
        quizzes: [String]
    ) {
        self.category = category
        self.quizzes = quizzes
    }
}
