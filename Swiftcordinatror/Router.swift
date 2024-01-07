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


class NavigationViewRouter: Router, ObservableObject {
    
    @Published private var internalRootView: [IdentifiableAnyView] = []
    @Published var hasDestination: Bool = false
    var rootView: [IdentifiableAnyView] {
        get { internalRootView }
        set { internalRootView = newValue }
    }
//    func push<Content: View>(content: Content, animated: Bool) {
//        let destinationView = IdentifiableAnyView(content)
//
//        if !rootView.isEmpty {
//            var navigationStack = rootView
//            navigationStack.append(destinationView)
//            rootView = navigationStack
//            print("Pushed: \(content)")
//        } else {
//            rootView = [destinationView]
//            print("Set root: \(content)")
//        }
////        print("Current navigation stack: \(rootView)")
//    }
//    
    func push<Content: View>(content: Content, animated: Bool) {
        let destinationView = IdentifiableAnyView(content)

        if !internalRootView.isEmpty {
            var navigationStack = internalRootView
            navigationStack.append(destinationView)
            internalRootView = navigationStack
            print("Pushed: \(content)")
        } else {
            internalRootView = [destinationView]
            print("Set root: \(content)")
        }
        print("Current navigation stack: \(internalRootView)")
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


