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
    
    @State private var isAlertShowing: Bool = false
    @State private var title: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
                }
            }
            .navigationTitle("Wishlist")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAlertShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
            }
            .alert("Create a new wish", isPresented: $isAlertShowing) {
                TextField("Enter a wish", text: $title)
                
                Button {
                    modelContext.insert(Wish(title: title))
                    title = ""
                } label: {
                    Text("Save")
                }
            }
            .overlay {
                if wishes.isEmpty {
                    ContentUnavailableView("My Wishlist", systemImage: "heart.circle", description: Text("No wishes yet. Add a wish to get started."))
                }
            }
        }
    }
}

#Preview("List with Sample Data") {
    let container = try! ModelContainer(for: Wish.self, configurations:
                                            ModelConfiguration(isStoredInMemoryOnly: true))
    
    container.mainContext.insert(Wish(title: "Buy a New Macbook"))
    container.mainContext.insert(Wish(title: "Download Xcode"))
    container.mainContext.insert(Wish(title: "Learn new technologies"))
    container.mainContext.insert(Wish(title: "Publish App"))
    container.mainContext.insert(Wish(title: "Travel to Europe"))
    
    return ContentView()
        .modelContainer(container)
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}

