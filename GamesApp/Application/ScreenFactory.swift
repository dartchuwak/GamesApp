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
    
    func makeMainScreen() -> MainView {
        return MainView(viewModel: applicationFactory.mainViewModel as! MainViewModel)
    }
    
    func makeSearchScreen() -> SearchView {
        return SearchView(viewModel: applicationFactory.searchViewModel as! SearchViewModel)
    }
    
    func makeTabViewScreen() -> some View {
         TabView {
             makeMainScreen()
                 .tabItem {
                     Image(systemName: "house.fill")
                     Text("Home")
                 }
             
             makeSearchScreen()
                 .tabItem {
                     Image(systemName: "star.fill")
                     Text("Favorites")
                 }
         }
     }
    
    
}
