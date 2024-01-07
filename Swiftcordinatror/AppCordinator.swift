//
//  AppCordinator.swift
//  Swiftcordinatror
//
//  Created by Nagaraju on 06/01/24.
//

import Foundation
import SwiftUI


class AppCoordinator: ObservableObject, Coordinator {
    
    @Published var hasDestination: Bool = false
    var router: Router
    var routerss: NavigationViewRouter
    var children: [Coordinator] = []
    var window: UIWindow?
    

    init(routerss: NavigationViewRouter, router: Router, window: UIWindow?) {
        self.router = router
        self.window = window
        self.routerss = routerss
    }
    
    func start() -> some View {
        let contentView = ContentView(coordinator: self)
            .environmentObject(routerss)

        // Set the initial root view for the router only once
        if let router = router as? NavigationViewRouter {
            let identifiableAnyView = IdentifiableAnyView(contentView)
            router.rootView = [identifiableAnyView]
        }

        // Print the initial root view for debugging
        if let router = router as? NavigationViewRouter {
            print("Initial Root View: \(String(describing: router.rootView))")
        }

        // Wrap the contentView in a NavigationView
        let rootView = NavigationView {
            contentView
        }

        // Return the rootView
        return rootView
    }
    
    

    func navigateToDetail() {
        print("Navigating to detail view...")
        let detailView = DetailView()
        router.push(content: detailView, animated: true)
        hasDestination = true
    }

    func present(animated: Bool, onDismissed: (() -> Void)?) {
        // Your presentation logic here
    }
}
