//
//  MockRouter.swift
//  RevisionApp
//
//  Created by Joe Taylor on 14/11/2024.
//

@testable import RevisionApp
import Combine

class MockRouter: RouterProtocol {
    // Track the stack state and the methods called
    var stack: [Route] = []
    private(set) var didPushRoute: Bool = false
    private(set) var didPop: Bool = false
    private(set) var didPopToRoot: Bool = false
    
    // To capture the last pushed route for testing verification
    private(set) var lastPushedRoute: Route?
    
    func push(to view: Route) {
        didPushRoute = true
        lastPushedRoute = view
        stack.append(view)
    }
    
    func pop() {
        didPop = true
        _ = stack.popLast()
    }
    
    func popToRootView() {
        didPopToRoot = true
        stack.removeAll()
    }
    
    // Reset method to reuse in multiple tests
    func reset() {
        stack.removeAll()
        didPushRoute = false
        didPop = false
        didPopToRoot = false
        lastPushedRoute = nil
    }
}
