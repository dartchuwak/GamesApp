//
//  ScreenFactory.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 21.03.2023.
//

import Foundation
import SwiftUI


let screenFactory = ScreenFactory()

final class ScreenFactory {
    
    fileprivate let applicationFactory = ApplicationFactory()
    fileprivate init() {
    }
    
    func makeGamesScreen() -> GamesView {
        return GamesView(viewModel: applicationFactory.mainViewModel as! MainViewModel)
    }
    
    func makeSearchScreen() -> SearchView {
        return SearchView(viewModel: applicationFactory.searchViewModel as! SearchViewModel)
    }
    
    func makeDiscountsScreen() -> DiscountsView {
        return DiscountsView()
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
                     Text("Поиск")
                 }
         }
     }
    
    
}
