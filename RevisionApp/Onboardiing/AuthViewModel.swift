//
//  AuthViewModel.swift
//  RevisionApp
//
//  Created by Joe Taylor on 08/12/2024.
//

import FirebaseAuth
import SwiftUI

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: UserModel?
    
    init() {
        
    }
    
    func signIn(email: String, password: String) async throws {
        
    }
        
    func createUser(email: String, password: String, name: String) async throws {
        
    }
    
    func signOut() async throws {
        
    }
    
    func deleteAccount() async throws {
        
    }
    
    func fetchUser() async {
        
    }
}
