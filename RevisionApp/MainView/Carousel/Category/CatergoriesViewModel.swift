//
//  CatergoriesViewModel.swift
//  RevisionApp
//
//  Created by Joe Taylor on 07/11/2024.
//

import Foundation

class CatergoriesViewModel: ObservableObject {
    
    var category: String = ""
    
    init(
        category: String
    ) {
        self.category = category
    }
    
}
