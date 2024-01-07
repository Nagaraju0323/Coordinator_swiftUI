//
//  SceneDelegate.swift
//  Swiftcordinatror
//
//  Created by Nagaraju on 06/01/24.
//

import Foundation

import SwiftUI

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)

            let yourRouter = NavigationViewRouter()
            let coordinator = AppCoordinator(routerss: NavigationViewRouter(), router: yourRouter, window: window)

            // Set the initial rootView for the router
            if let router = yourRouter as? NavigationViewRouter {
                let contentView = ContentView(coordinator: coordinator)
                let identifiableAnyView = IdentifiableAnyView(contentView)
                router.rootView = [identifiableAnyView]
            }

            _ = coordinator.start()

            self.window = window
        }
    }


    func sceneDidDisconnect(_ scene: UIScene) {
      
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
      
    }

    func sceneWillResignActive(_ scene: UIScene) {
      
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
      
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
      
    }
}
