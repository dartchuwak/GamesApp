//
//  CellViewModel.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 14.03.2023.
//

import Foundation


class CellViewModel: ObservableObject {
    
    var game: Game
    
    init ( game: Game) {
        self.game = game
    }
}
