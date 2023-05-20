//
//  ScreenFactory.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 21.03.2023.
//

import Foundation
import SwiftUI


final class ScreenFactory {
    
    static let instance = ScreenFactory()
    
    fileprivate let applicationFactory = ApplicationFactory()
    fileprivate init() {}
    
    func makeGamesScreen() -> GamesView {
        return GamesView()
    }
    
    func makeSearchScreen() -> SearchView {
        return SearchView(viewModel: applicationFactory.searchViewModel)
    }
    
    func makeFavScreen() -> FavoritesView {
        return FavoritesView()
    }
    
    
    func makeTabViewScreen() -> some View {
         TabView {
             
             makeGamesScreen()
                 .tabItem {
                     Image(systemName: "house.fill")
                     Text("Home")
                 }
             
             makeSearchScreen()
                 .tabItem {
                     Image(systemName: "magnifyingglass")
                     Text("Search")
                 }
             
             makeFavScreen()
                 .tabItem {
                     Image(systemName: "star.fill")
                     Text("Favorites")
                 }
             
             
         }
         .onAppear {
             print ("TabView Appeared")
         }
     }
    
    
}
