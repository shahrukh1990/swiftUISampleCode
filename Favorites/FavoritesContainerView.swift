//
//  FavoritesContainerView.swift
//  Recipes
//
//  Created by Shahrukh Jain on 11/10/20.
//  Copyright © 2020 Shahrukh Jain. All rights reserved.
//
import SwiftUI

struct FavoritesContainerView: View {
    @EnvironmentObject var store: AppStore

    private var favorites: [Recipe] {
        store.state.favorited.compactMap {
            store.state.allRecipes[$0]
        }
    }

    var body: some View {
        RecipesView(recipes: favorites)
            .navigationBarTitle("favorites")
    }
}
