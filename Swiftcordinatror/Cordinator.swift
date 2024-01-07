//
//  Cordinator.swift
//  Swiftcordinatror
//
//  Created by Nagaraju on 05/01/24.
//

import Foundation
import SwiftUI

protocol Coordinator: AnyObject {
    var children: [Coordinator] { get set }
    var router: Router { get }

    func present(animated: Bool, onDismissed: (() -> Void)?)
    func dismiss(animated: Bool)
    func presentChild(_ child: Coordinator, animated: Bool, onDismissed: (() -> Void)?)
}

extension Coordinator {
    // 1
    public func dismiss(animated: Bool) {
    
    }

    // 2
    public func presentChild(_ child: Coordinator, animated: Bool, onDismissed: (() -> Void)? = nil) {
        children.append(child)
        child.present(
            animated: animated,
            onDismissed: { [weak self, weak child] in
                guard let self = self, let child = child else {
                    return
                }
                self.removeChild(child)
                onDismissed?()
            }
        )
    }
    
    // 4
    private func removeChild(_ child: Coordinator) {
        guard let index = children.firstIndex(where: { $0 === child }) else {
            return
        }
        children.remove(at: index)
    }
}
