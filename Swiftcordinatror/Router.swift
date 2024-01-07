//
//  Router.swift
//  Swiftcordinatror
//
//  Created by Nagaraju on 06/01/24.
//

import Foundation
import SwiftUI
import Combine

protocol Router {
//    func push<Content: View>(content: Content, animated: Bool)
//    func pop(animated: Bool)
//    func present<Content: View>(content: Content, animated: Bool, onDismissed: (() -> Void)?)
//    func dismiss(animated: Bool)
//    func setRootView<Content: View>(content: Content)
   
    var rootView: [IdentifiableAnyView] { get set }

    func push<Content: View>(content: Content, animated: Bool)
}


//class NavigationViewRouter: Router, ObservableObject {
//    
//    @Published private var internalRootView: [IdentifiableAnyView]?
//   
//   
//    var rootView: [IdentifiableAnyView]? {
//        get { internalRootView }
//        set { internalRootView = newValue }
//        
//    }
//  
//    func push<Content: View>(content: Content, animated: Bool) {
//        let destinationView = IdentifiableAnyView(content)
//
//        if var navigationStack = rootView {
//            // The rootView is not nil, so it's not the first time setting it
//            navigationStack.append(destinationView)
//            rootView = navigationStack
//            print("Pushed: \(content)")
//        } else {
//            // The rootView is nil, set it to be [destinationView]
//            rootView = [destinationView]
//            print("Set root: \(content)")
//        }
//    }
//   
//}


//class NavigationViewRouter: Router, ObservableObject {
//    @Published private var internalRootView: [IdentifiableAnyView] = []
//
//    var rootView: [IdentifiableAnyView]? {
//        get { internalRootView }
//        set {
//            // Safely unwrap newValue using optional binding
//            if let unwrappedValue = newValue {
//                internalRootView = unwrappedValue
//            } else {
//                // Handle the case where newValue is nil, if needed
//                // For example, you might choose to keep the existing array or create a new one.
//                internalRootView = []
//            }
//        }
//    }
//
//    func push<Content: View>(content: Content, animated: Bool) {
//        let destinationView = IdentifiableAnyView(content)
//
//        if var navigationStack = rootView {
//            // The rootView is not nil, so it's not the first time setting it
//            navigationStack.append(destinationView)
//            rootView = navigationStack
//            print("Pushed: \(content)")
//        } else {
//            // The rootView is nil, set it to be [destinationView]
//            rootView = [destinationView]
//            print("Set root: \(content)")
//        }
//        print("Current navigation stack: \(rootView)")
//    }
//   
//}


//class NavigationViewRouter: Router, ObservableObject {
//    @Published private var internalRootView: [IdentifiableAnyView]?
//    @Published var hasDestination: Bool = false
//
//    var rootView: [IdentifiableAnyView]? {
//            get { internalRootView }
//            set {
//                objectWillChange.send()
//                internalRootView = newValue
//                print("Updated navigation stack: \(internalRootView ?? [])")
//            }
//        }
//
//    func push<Content: View>(content: Content, animated: Bool) {
//        let destinationView = IdentifiableAnyView(content)
//
//        if var navigationStack = rootView {
//            // The rootView is not nil, so it's not the first time setting it
//            navigationStack.append(destinationView)
//            rootView = navigationStack
//            print("Pushed: \(content)")
//        } else {
//            // The rootView is nil, set it to be [destinationView]
//            rootView = [destinationView]
//            print("Set root: \(content)")
//        }
//    }
//}


class NavigationViewRouter: Router, ObservableObject {
   
    
    
    @Published private var internalRootView: [IdentifiableAnyView] = []
    @Published var hasDestination: Bool = false
    var rootView: [IdentifiableAnyView] {
        get { internalRootView }
        set { internalRootView = newValue }
    }
   

    

    func push<Content: View>(content: Content, animated: Bool) {
        let destinationView = IdentifiableAnyView(content)

        if !rootView.isEmpty {
            // The rootView is not empty, so it's not the first time setting it
            var navigationStack = rootView
            navigationStack.append(destinationView)
            rootView = navigationStack
            print("Pushed: \(content)")
        } else {
            // The rootView is nil or empty, set it to be [destinationView]
            rootView = [destinationView]
            print("Set root: \(content)")
        }
        print("Current navigation stack: \(rootView)")
    }
}





struct IdentifiableAnyView: View, Identifiable, Hashable {
    let id = UUID()
    let content: AnyView

    init<Content: View>(_ content: Content) {
        self.content = AnyView(content)
    }

    var body: some View {
        content
    }

    static func == (lhs: IdentifiableAnyView, rhs: IdentifiableAnyView) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}




//extension Router {
//    // Provide default implementation for pop
//    func pop(animated: Bool) {
//
//        // Default implementation can be empty or can be handled by a specific router
//    }
//
//    // Provide default implementation for dismiss
//    func dismiss(animated: Bool) {
//        // Default implementation can be empty or can be handled by a specific router
//    }
//
//    // Provide default implementation for setRootView
//    func setRootView<Content: View>(content: Content) {
//        print("setRootVieController")
//        // Default implementation can be empty or can be handled by a specific router
//    }
//}
