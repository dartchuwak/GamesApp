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
    
    func makeFavScreen() -> FavoritesView {
        return FavoritesView()
    }
}
