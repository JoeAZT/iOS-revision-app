//
//  SignUpViewModel.swift
//  RevisionApp
//
//  Created by Joe Taylor on 07/12/2024.
//

import Foundation
import Combine

class SignUpViewModel: ObservableObject {
    @Published var name: String
    @Published var email: String
    @Published var passwordText: String
    @Published var confirmPasswordText: String
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false

    private var cancellables = Set<AnyCancellable>()
    
    init(
        name: String = "",
        email: String = "",
        password: String = "",
        confirmPassword: String = "",
        errorMessage: String? = nil,
        isLoading: Bool = false,
        cancellables: Set<AnyCancellable> = Set<AnyCancellable>()
    ) {
        self.name = name
        self.email = email
        self.passwordText = password
        self.confirmPasswordText = confirmPassword
        self.errorMessage = errorMessage
        self.isLoading = isLoading
        self.cancellables = cancellables
    }
    
    func signUp(email: String, password: String, name: String) async throws {
        print("Sign up:")
        print("email: \(email)")
        print("password: \(password)")
        print("name: \(name)")
    }
}
