//
//  ContentView.swift
//  Swiftcordinatror
//
//  Created by Nagaraju on 05/01/24.
//

import SwiftUI
struct ContentView: View {
    @EnvironmentObject var router: NavigationViewRouter
    var coordinator: AppCoordinator

    @State private var navigationActive: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, world!")

                NavigationLink(destination: DetailView(), isActive: $navigationActive) {
                    EmptyView()
                        .onAppear {
                            print("NavigationLink isActive: \(navigationActive)")
                        }
                }

                Button("Update Navigation Stack") {
                    coordinator.navigateToDetail()
                    navigationActive = coordinator.hasDestination
                    print("hasDestination after tapping button: \(coordinator.hasDestination)")
                }
                .padding()
            }
        }
        .environmentObject(NavigationViewRouter())
    }
}


struct DetailView: View {
    var body: some View {
        VStack {
            Text("DetailView")
        }
        .onAppear {
            print("DetailView appeared")
        }
    }
}

//#Preview {
//    ContentView()
//}

