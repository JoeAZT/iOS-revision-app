//
//  SignUpViewModel.swift
//  RevisionApp
//
//  Created by Joe Taylor on 07/12/2024.
//

import Foundation
import Combine

class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false

    private var cancellables = Set<AnyCancellable>()
    
    init(
        email: String,
        password: String,
        confirmPassword: String,
        errorMessage: String? = nil,
        isLoading: Bool,
        cancellables: Set<AnyCancellable> = Set<AnyCancellable>()
    ) {
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
        self.errorMessage = errorMessage
        self.isLoading = isLoading
        self.cancellables = cancellables
    }

    // Simulate a registration service (replace with real backend logic)
    private func performSignUp(email: String, password: String) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                // Simulate success if email is valid and password is non-empty
                if email.contains("@") && !password.isEmpty {
                    promise(.success(true))
                } else {
                    promise(.failure(NSError(domain: "", code: 400, userInfo: [NSLocalizedDescriptionKey: "Invalid email or password"])))
                }
            }
        }
        .eraseToAnyPublisher()
    }

    func signUp() {
        guard !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            errorMessage = "Please fill in all fields."
            return
        }

        guard password == confirmPassword else {
            errorMessage = "Passwords do not match."
            return
        }

        isLoading = true
        errorMessage = nil

        performSignUp(email: email, password: password)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] success in
                if success {
                    // Handle successful signup, e.g., navigate to login or main app
                    print("Sign-up successful")
                }
            }
            .store(in: &cancellables)
    }
}
