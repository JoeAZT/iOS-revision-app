//
//  UserModel.swift
//  RevisionApp
//
//  Created by Joe Taylor on 08/12/2024.
//

import Foundation

struct User: Codable, Identifiable {
    var name: String
    var username: String
    var password: String
    var id: String
}

extension User {
    static var mock: User {
        User(name: "Joe", username: "Joeazt", password: "password", id: "id")
    }
}
