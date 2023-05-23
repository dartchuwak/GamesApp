//
//  CellViewModel.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 14.03.2023.
//

import Foundation
import UIKit
import SwiftUI


class GameCellViewModel: ObservableObject {
    
    var game: Game
    var imageURL: String?
    var coverData: UIImage?
    
    init (game: Game) {
        self.game = game
    }
    
    
    func fetchGames() async {
        
    }
}
