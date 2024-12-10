//
//  UserModel.swift
//  RevisionApp
//
//  Created by Joe Taylor on 08/12/2024.
//

import Foundation

struct User: Codable, Identifiable {
    var username: String
    var password: String
    var id: String
}

extension User {
    static var mock: User {
        User(username: "Joe", password: "password", id: "id")
    }
}
