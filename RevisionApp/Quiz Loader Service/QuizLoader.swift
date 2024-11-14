//
//  QuizLoader.swift
//  RevisionApp
//
//  Created by Joe Taylor on 14/11/2024.
//

import SwiftUI

protocol QuizLoader {
    func loadQuizNames() -> [String]?
    func loadQuizCategories() -> [String]?
}

class JSONQuizLoader: QuizLoader {
    func loadQuizNames() -> [String]? {
        return loadData(from: "Quizzes")
    }
    
    func loadQuizCategories() -> [String]? {
        return loadData(from: "Categories")
    }
    
    private func loadData(from resource: String) -> [String]? {
        guard let url = Bundle.main.url(forResource: resource, withExtension: "json") else {
            print("Could not find \(resource).json")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode([String].self, from: data)
        } catch {
            print("Error decoding JSON for \(resource): \(error.localizedDescription)")
            return nil
        }
    }
}
