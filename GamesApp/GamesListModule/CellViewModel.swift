//
//  CellViewModel.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 14.03.2023.
//

import Foundation


class CellViewModel: ObservableObject {
    
    var game: Game
    
    var priceDifferenceInPercent: Double {
        let basePrice = Double(game.BasePrice)!
        let salePrice = Double(game.SalePrice)!
           
           let priceDifference = basePrice - salePrice
           let percentageDifference = (priceDifference / basePrice) * 100

           return percentageDifference
       }
    
    init ( game: Game) {
        self.game = game
    }
}
