//
//  HomeContainerView.swift
//  Recipes
//
//  Created by Shahrukh Jain on 11/10/20.
//  Copyright © 2020 Shahrukh Jain. All rights reserved.
//
import SwiftUI

struct HomeContainerView: View {
    @EnvironmentObject var store: AppStore
    @State private var favoritesShown = false

    private var hasFavorites: Bool {
        !store.state.favorited.isEmpty
    }

    private var health: Binding<Health> {
        store.binding(for: \.health) { .setHealth(health: $0) }
    }

    var body: some View {
        HomeView(health: health)
            .navigationBarTitle("recipes")
            .navigationBarItems(
                trailing: hasFavorites ? Button(action: { self.favoritesShown = true }) {
                    Image(systemName: "heart.fill")
                        .font(.headline)
                        .accessibility(label: Text("favorites"))
                } : nil
        ).sheet(isPresented: $favoritesShown) {
                FavoritesContainerView()
                    .environmentObject(self.store)
                    .embedInNavigation()
                    .accentColor(.green)
        }
    }
}
