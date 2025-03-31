//
//  ContentView.swift
//  Wishlist
//
//  Created by Jibryll Brinkley on 3/30/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                }
            }
            .navigationTitle("Wishlist")
            .overlay {
                if wishes.isEmpty {
                    ContentUnavailableView("My Wishlist", systemImage: "heart.circle", description: Text("No wishes yet. Add a wish to get started."))
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}
