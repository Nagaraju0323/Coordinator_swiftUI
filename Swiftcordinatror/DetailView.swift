//
//  DetailView.swift
//  Swiftcordinatror
//
//  Created by Nagaraju on 06/01/24.
//

import SwiftUI
class DetailCoordinator: Coordinator {
    func present(animated: Bool, onDismissed: (() -> Void)?) {
      
    }
    
    var children: [Coordinator] = []
    var router: Router

    init(router: Router) {
        self.router = router
    }

    func start() {
        // Implement the start logic for the detail coordinator
    }

    // Additional methods specific to the detail coordinator can be added here
}



