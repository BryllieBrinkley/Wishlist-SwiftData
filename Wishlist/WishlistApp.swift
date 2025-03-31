//
//  WishlistApp.swift
//  Wishlist
//
//  Created by Jibryll Brinkley on 3/30/25.
//

import SwiftUI
import SwiftData

@main
struct WishlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Wish.self)
        }
    }
}
