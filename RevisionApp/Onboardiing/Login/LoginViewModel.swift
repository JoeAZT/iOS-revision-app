//
//  LoginViewModel.swift
//  RevisionApp
//
//  Created by Joe Taylor on 07/12/2024.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var email: String
    @Published var password: String
    @Published var errorMessage: String?
    @Published var isLoading: Bool
    
    private var cancellables = Set<AnyCancellable>()
    
    init(
        email: String = "",
        password: String = "",
        errorMessage: String? = nil,
        isLoading: Bool = false,
        cancellables: Set<AnyCancellable> = Set<AnyCancellable>()
    ) {
        self.email = email
        self.password = password
        self.errorMessage = errorMessage
        self.isLoading = isLoading
        self.cancellables = cancellables
    }
    
    // Simulate a login service (replace with real backend logic)
    private func performLogin(email: String, password: String) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                if email == "test@example.com" && password == "password" {
                    promise(.success(true))
                } else {
                    promise(.failure(NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "Invalid email or password"])))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func login(email: String, password: String) async throws {
        print("Login:")
        print("email: \(email)")
        print("password: \(password)")
    }
}
