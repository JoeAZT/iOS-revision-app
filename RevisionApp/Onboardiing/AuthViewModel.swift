//
//  AuthViewModel.swift
//  RevisionApp
//
//  Created by Joe Taylor on 08/12/2024.
//

import FirebaseFirestore
import FirebaseAuth
import SwiftUI

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User = User(username: "", password: "", id: "")
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var passwordText: String = ""
    @Published var confirmPasswordText: String = ""
    
    init() {
    }
    
    func signIn(email: String, password: String) async throws {
    
    }
    
    func createUser(email: String, password: String, name: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user

            let user = User(username: email, password: password, id: result.user.uid)
            try await Firestore.firestore().collection("users").document(user.id).setData(from: user)
        } catch {
            print("DEBUG: Error signing in \(error.localizedDescription)")
            throw error
        }
    }
    
    func signOut() async throws {
        
    }
    
    func deleteAccount() async throws {
        
    }
    
    func fetchUser() async {
        
    }
}
