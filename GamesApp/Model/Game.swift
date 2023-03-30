//
//  Character.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 13.03.2023.
//

import Foundation
import SwiftUI


struct Game: Decodable, Identifiable, Hashable  {
    
    static func == (lhs: Game, rhs: Game) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: Int?
    let name: String?
    let background_image: String?
    let metacritic: Int?
    let rating: Float?
    let rating_top: Int
}

struct GameDetails: Decodable {
    let id: Int
    let name: String
    let description: String
    let background_image: String?
    let released: String?
}

struct GamesResponse: Decodable, Equatable {
    let count :Int
    let results: [Game]?
}

struct ScreenshotsResponse: Decodable {
    let count: Int?
    let results : [Screenshot]
}

struct Screenshot: Decodable, Hashable, Identifiable {
    let id: Int
    let image: String
    let width: Int
    let height: Int
}




