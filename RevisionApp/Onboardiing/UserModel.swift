//
//  UserModel.swift
//  RevisionApp
//
//  Created by Joe Taylor on 08/12/2024.
//

import Foundation

struct UserModel {
    var username: String
    var password: String
}

extension UserModel {
    static var mock: UserModel {
        UserModel(username: "Joe", password: "password")
    }
}
