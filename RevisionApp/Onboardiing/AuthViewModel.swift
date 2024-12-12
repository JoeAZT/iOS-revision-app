//
//  AuthViewModel.swift
//  RevisionApp
//
//  Created by Joe Taylor on 08/12/2024.
//

import FirebaseFirestore
import FirebaseAuth
import SwiftUI

@MainActor
class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var passwordText: String = ""
    @Published var confirmPasswordText: String = ""
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    init() {
        self.userSession = Auth.auth().currentUser
        Task {
            await fetchUser()
        }
    }
    
    func signIn(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Error signing in \(error.localizedDescription)")
            throw error
        }
    }
    
    func signUp(name: String, email: String, password: String, confirmPassword: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user

            let user = User(name: name, username: email, password: password, id: result.user.uid)
            try await Firestore.firestore().collection("users").document(user.id).setData(from: user)
            await fetchUser()
        } catch {
            print("DEBUG: Error signing in \(error.localizedDescription)")
            throw error
        }
    }
    
    func signOut() async throws {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: Error signing out \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() async throws {
        
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
        print("DEBUG: Current user \(currentUser)")
    }
}
