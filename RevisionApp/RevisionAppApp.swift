//
//  RevisionAppApp.swift
//  RevisionApp
//
//  Created by Joe Taylor on 12/08/2024.
//

import SwiftUI
import FirebaseCore

@main
struct RevisionAppApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView(
                viewModel: QuizViewModel(
                    score: 0,
                    currentQuestion: 0
                )
            )
        }
    }
}

//questionModel: [
//        QuestionModel(
//            questionText: "What is the difference between a struct and a class in Swift?",
//            possibleAnswers: [
//                OptionModel(optionText: "They're the same thing", isAnswer: false),
//                OptionModel(optionText: "They're spelt different", isAnswer: false),
//                OptionModel(optionText: "Structs are value types, Classes are reference types", isAnswer: true),
//                OptionModel(optionText: "Classes are mutable and structs aren't", isAnswer: false)
//            ]
//        ),
//        QuestionModel(
//            questionText: "When would you use one over the other?",
//            possibleAnswers: [
//                OptionModel(optionText: "Always use classes", isAnswer: false),
//                OptionModel(optionText: "Always use structs", isAnswer: false),
//                OptionModel(optionText: "Use structs for simple data models that are immutable or don't require inheritance. Use classes when you need inheritance, shared mutable state, or if your type should be a reference type (e.g., when working with frameworks that expect classes, such as UIKit).", isAnswer: true),
//                OptionModel(optionText: "You can use either as they can both inherit and work well for anything we need", isAnswer: false)
//            ]
//        ),
//        QuestionModel(
//            questionText: "What is the difference between synchronous and asynchronous tasks?",
//            possibleAnswers: [
//                OptionModel(optionText: "Synchronous tasks are blocking, asynchronous tasks are non-blocking", isAnswer: true),
//                OptionModel(optionText: "Asynchronous tasks are faster", isAnswer: false),
//                OptionModel(optionText: "Synchronous tasks are executed in the background", isAnswer: false),
//                OptionModel(optionText: "There is no difference", isAnswer: false)
//            ]
//        ),
//        QuestionModel(
//            questionText: "What are optionals in Swift?",
//            possibleAnswers: [
//                OptionModel(optionText: "A type that can hold either a value or nil", isAnswer: true),
//                OptionModel(optionText: "A type that must always have a value", isAnswer: false),
//                OptionModel(optionText: "A function that returns void", isAnswer: false),
//                OptionModel(optionText: "A variable that cannot change", isAnswer: false)
//            ]
//        ),
//        QuestionModel(
//            questionText: "What is the purpose of a guard statement in Swift?",
//            possibleAnswers: [
//                OptionModel(optionText: "To handle optional binding and exit early if conditions aren't met", isAnswer: true),
//                OptionModel(optionText: "To create infinite loops", isAnswer: false),
//                OptionModel(optionText: "To declare constants", isAnswer: false),
//                OptionModel(optionText: "To break out of a switch statement", isAnswer: false)
//            ]
//        ),
//        QuestionModel(
//            questionText: "What is GCD (Grand Central Dispatch) used for in iOS?",
//            possibleAnswers: [
//                OptionModel(optionText: "For handling image processing", isAnswer: false),
//                OptionModel(optionText: "For managing background threads and asynchronous operations", isAnswer: true),
//                OptionModel(optionText: "For managing database queries", isAnswer: false),
//                OptionModel(optionText: "For creating user interfaces", isAnswer: false)
//            ]
//        ),
//        QuestionModel(
//            questionText: "What is a completion handler?",
//            possibleAnswers: [
//                OptionModel(optionText: "A function that is called when another task has finished", isAnswer: true),
//                OptionModel(optionText: "A function that processes strings", isAnswer: false),
//                OptionModel(optionText: "A type of loop", isAnswer: false),
//                OptionModel(optionText: "A tool for error handling", isAnswer: false)
//            ]
//        ),
//        QuestionModel(
//            questionText: "What is a closure in Swift?",
//            possibleAnswers: [
//                OptionModel(optionText: "A function without a name", isAnswer: false),
//                OptionModel(optionText: "A self-contained block of functionality that can be passed around and used in your code", isAnswer: true),
//                OptionModel(optionText: "A type of data structure", isAnswer: false),
//                OptionModel(optionText: "A tool for string manipulation", isAnswer: false)
//            ]
//        ),
//        QuestionModel(
//            questionText: "What is a delegate in iOS development?",
//            possibleAnswers: [
//                OptionModel(optionText: "A class that defines the blueprint of methods that another class must implement", isAnswer: false),
//                OptionModel(optionText: "A design pattern that allows one object to communicate with another by sending messages through a delegate protocol", isAnswer: true),
//                OptionModel(optionText: "A tool for multithreading", isAnswer: false),
//                OptionModel(optionText: "A subclass of UIView", isAnswer: false)
//            ]
//        ),
//        QuestionModel(
//            questionText: "What is the difference between weak and strong references?",
//            possibleAnswers: [
//                OptionModel(optionText: "Strong references keep an object in memory, weak references do not", isAnswer: true),
//                OptionModel(optionText: "Weak references are faster", isAnswer: false),
//                OptionModel(optionText: "Strong references are used only in closures", isAnswer: false),
//                OptionModel(optionText: "There is no difference", isAnswer: false)
//            ]
//        ),
//        QuestionModel(
//            questionText: "What is the purpose of the @escaping keyword in Swift?",
//            possibleAnswers: [
//                OptionModel(optionText: "@escaping is used to mark closures that can outlive the function they were passed to", isAnswer: true),
//                OptionModel(optionText: "@escaping makes a closure run faster", isAnswer: false),
//                OptionModel(optionText: "@escaping prevents memory leaks", isAnswer: false),
//                OptionModel(optionText: "@escaping is used in protocols", isAnswer: false)
//            ]
//        ),
//        QuestionModel(
//            questionText: "What is a protocol in Swift?",
//            possibleAnswers: [
//                OptionModel(optionText: "A blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality", isAnswer: true),
//                OptionModel(optionText: "A type of loop", isAnswer: false),
//                OptionModel(optionText: "A data structure for managing collections", isAnswer: false),
//                OptionModel(optionText: "A method for error handling", isAnswer: false)
//            ]
//        ),
//        QuestionModel(
//            questionText: "What is Core Data used for?",
//            possibleAnswers: [
//                OptionModel(optionText: "For creating animations", isAnswer: false),
//                OptionModel(optionText: "For managing object graphs and persistent storage", isAnswer: true),
//                OptionModel(optionText: "For handling networking", isAnswer: false),
//                OptionModel(optionText: "For managing views and layout", isAnswer: false)
//            ]
//        ),
//        QuestionModel(
//            questionText: "What is the difference between frame and bounds in iOS?",
//            possibleAnswers: [
//                OptionModel(optionText: "Frame refers to the view's position in its superview's coordinate system, bounds refers to the view's own coordinate system", isAnswer: true),
//                OptionModel(optionText: "Bounds are used for animations", isAnswer: false),
//                OptionModel(optionText: "Frame is for layout, bounds is for drawing", isAnswer: false),
//                OptionModel(optionText: "There is no difference", isAnswer: false)
//            ]
//        ),
//        QuestionModel(
//            questionText: "What is the purpose of the 'lazy' keyword in Swift?",
//            possibleAnswers: [
//                OptionModel(optionText: "To delay the creation of an object until it's actually needed", isAnswer: true),
//                OptionModel(optionText: "To improve performance by preloading data", isAnswer: false),
//                OptionModel(optionText: "To reduce memory usage", isAnswer: false),
//                OptionModel(optionText: "To create static variables", isAnswer: false)
//            ]
//        ),
//        QuestionModel(
//            questionText: "How does memory management work in iOS?",
//            possibleAnswers: [
//                OptionModel(optionText: "iOS uses Automatic Reference Counting (ARC) to manage memory", isAnswer: true),
//                OptionModel(optionText: "Developers must manually allocate and free memory", isAnswer: false),
//                OptionModel(optionText: "Memory is managed by the operating system with no developer intervention", isAnswer: false),
//                OptionModel(optionText: "Memory management is not a concern in iOS", isAnswer: false)
//            ]
//        ),
//        QuestionModel(
//            questionText: "What is SwiftUI?",
//            possibleAnswers: [
//                OptionModel(optionText: "A framework for building user interfaces across all Apple platforms", isAnswer: true),
//                OptionModel(optionText: "A new programming language", isAnswer: false),
//                OptionModel(optionText: "A tool for managing databases", isAnswer: false),
//                OptionModel(optionText: "A type of data structure", isAnswer: false)
//            ]
//        ),
//        QuestionModel(
//            questionText: "What is a property wrapper in Swift?",
//            possibleAnswers: [
//                OptionModel(optionText: "A custom attribute that can add behavior to properties", isAnswer: true),
//                OptionModel(optionText: "A tool for creating loops", isAnswer: false),
//                OptionModel(optionText: "A method for error handling", isAnswer: false),
//                OptionModel(optionText: "A design pattern for delegation", isAnswer: false)
//            ]
//        ),
//        QuestionModel(
//            questionText: "What is the purpose of the @State keyword in SwiftUI?",
//            possibleAnswers: [
//                OptionModel(optionText: "To create a mutable state that is tied to the lifecycle of the view", isAnswer: true),
//                OptionModel(optionText: "To create a constant", isAnswer: false),
//                OptionModel(optionText: "To handle network requests", isAnswer: false),
//                OptionModel(optionText: "To define view hierarchies", isAnswer: false)
//            ]
//        ),
//        QuestionModel(
//            questionText: "What is the difference between @State and @Binding in SwiftUI?",
//            possibleAnswers: [
//                OptionModel(optionText: "@State is used to manage state within a view, @Binding is used to pass a reference to that state to another view", isAnswer: true),
//                OptionModel(optionText: "@State is for local variables, @Binding is for constants", isAnswer: false),
//                OptionModel(optionText: "@Binding is used for classes, @State is used for structs", isAnswer: false),
//                OptionModel(optionText: "There is no difference", isAnswer: false)
//            ]
//        ),
//        QuestionModel(
//            questionText: "What is MVVM?",
//            possibleAnswers: [
//                OptionModel(optionText: "A design pattern that separates objects into three types: Model, View, and ViewModel", isAnswer: true),
//                OptionModel(optionText: "A method for memory management", isAnswer: false),
//                OptionModel(optionText: "A framework for animations", isAnswer: false),
//                OptionModel(optionText: "A data structure for lists", isAnswer: false)
//            ]
//        ),
//        QuestionModel(
//            questionText: "What is a Combine framework in iOS?",
//            possibleAnswers: [
//                OptionModel(optionText: "A framework for handling asynchronous events using declarative Swift API", isAnswer: true),
//                OptionModel(optionText: "A framework for managing images", isAnswer: false),
//                OptionModel(optionText: "A tool for debugging", isAnswer: false),
//                OptionModel(optionText: "A UI framework for animation", isAnswer: false)
//            ]
//        ),
//        QuestionModel(
//            questionText: "How do you handle errors in Swift?",
//            possibleAnswers: [
//                OptionModel(optionText: "Using do-catch blocks to catch and handle errors", isAnswer: true),
//                OptionModel(optionText: "Using try-catch blocks like in other languages", isAnswer: false),
//                OptionModel(optionText: "Using guard statements", isAnswer: false),
//                OptionModel(optionText: "Using if-else statements", isAnswer: false)
//            ]
//        ),
//        QuestionModel(
//            questionText: "What is the difference between map, flatMap, and compactMap?",
//            possibleAnswers: [
//                OptionModel(optionText: "map transforms each element, flatMap flattens nested sequences, and compactMap removes nil values", isAnswer: true),
//                OptionModel(optionText: "They're all the same", isAnswer: false),
//                OptionModel(optionText: "flatMap and compactMap are for optionals only", isAnswer: false),
//                OptionModel(optionText: "map removes duplicates", isAnswer: false)
//            ]
//        ),
//        QuestionModel(
//            questionText: "What is a tuple in Swift?",
//            possibleAnswers: [
//                OptionModel(optionText: "A group of multiple values that can be of different types, grouped into a single compound value", isAnswer: true),
//                OptionModel(optionText: "A loop that iterates over a collection", isAnswer: false),
//                OptionModel(optionText: "A data structure for storing key-value pairs", isAnswer: false),
//                OptionModel(optionText: "A subclass of UIView", isAnswer: false)
//            ]
//        )
//    ],
