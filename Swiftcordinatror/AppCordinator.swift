//
//  AppCordinator.swift
//  Swiftcordinatror
//
//  Created by Nagaraju on 06/01/24.
//

import Foundation
import SwiftUI


class AppCoordinator: ObservableObject, Coordinator {
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

        let hostingController = UIHostingController(rootView: contentView)

        let navigationController = UINavigationController(rootViewController: hostingController)

        window?.rootViewController = navigationController

        window?.makeKeyAndVisible()

        // Return a dummy view, or you can return the actual rootView
        return EmptyView()
    }

    func navigateToDetail() {
        
        let detailView = DetailView()
        routerss.push(content: detailView, animated: true)
//        routerss.hasDestination = true
    }

    func present(animated: Bool, onDismissed: (() -> Void)?) {
        // Your presentation logic here
    }
}
