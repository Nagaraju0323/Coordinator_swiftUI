//
//  SwiftcordinatrorApp.swift
//  Swiftcordinatror
//
//  Created by Nagaraju on 05/01/24.
//

import SwiftUI

@main

struct SwiftCoordinatorApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView(coordinator: AppCoordinator(routerss: NavigationViewRouter(), router: NavigationViewRouter(), window: UIWindow()))
                            .environmentObject(NavigationViewRouter())
            
            
        }
    }
    
}


