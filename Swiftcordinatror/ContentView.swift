//
//  ContentView.swift
//  Swiftcordinatror
//
//  Created by Nagaraju on 05/01/24.
//

import SwiftUI


//struct ContentView: View {
//    @EnvironmentObject var router: NavigationViewRouter
//    var coordinator: AppCoordinator
//    @State private var navigationStack: [IdentifiableAnyView] = []
//
//    init(coordinator: AppCoordinator) {
//        self.coordinator = coordinator
//    }
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                Image(systemName: "globe")
//                    .imageScale(.large)
//                    .foregroundColor(.blue) // Use foregroundColor instead of foregroundStyle
//                Text("Hello, world!")
//
//                // Use a NavigationLink to navigate to the detail view
//                Text("ContentView updated with navigation stack: \(String(describing: router.rootView) ?? "")")
//                    .onAppear {
//                        print("ContentView appeared with navigation stack: \(String(describing: router.rootView) ?? "")")
//                    }
//
//                Button("Update Navigation Stack") {
//                    // Call the push method to add a new view to the stack
//                    let detailView = DetailView()
//                    router.push(content: detailView, animated: true)
//
//                    // Update the local binding to trigger a view update
//                    navigationStack = router.rootView ?? []
//                }
//
//                
//                
//            }
//            .padding()
//        }
//    }
//}


struct ContentView: View {
    @EnvironmentObject var router: NavigationViewRouter
    var coordinator: AppCoordinator

    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.blue)
                Text("Hello, world!")

                NavigationLink(destination: DetailView(), isActive: $router.hasDestination) {
                    EmptyView()
                }
                .hidden()

                Text("ContentView updated with navigation stack: \(String(describing: router.rootView) ?? "")")

                Button("Update Navigation Stack") {
                    coordinator.navigateToDetail()
                }
            }
            .padding()
        }
    }
}
//}



struct DetailView: View {
    var body: some View {
        VStack {
            
            Text("nagaraju!")
        }
        .padding()
    }
}


//#Preview {
//    ContentView()
//}

