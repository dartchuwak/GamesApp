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
    var releaseDate: String {
        let initialDateStr = game.released ?? ""
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd.MM.yyyy"

        if let date = dateFormatterGet.date(from: initialDateStr) {
            return dateFormatterPrint.string(from: date)
        }
        return "TBA"
    }
    
    init (game: Game) {
        self.game = game
    }
 
}
