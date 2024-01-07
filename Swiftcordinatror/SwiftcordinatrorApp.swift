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
            let routerss = NavigationViewRouter()
            ContentView(coordinator: AppCoordinator(routerss: routerss, router: routerss, window: UIWindow()))
                .environmentObject(routerss)
        }
    }
}


