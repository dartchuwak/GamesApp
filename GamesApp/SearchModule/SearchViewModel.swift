//
//  SearchViewModel.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 03.04.2023.
//

import Foundation
import Combine


final class SearchViewModel: ObservableObject {
    
    
    @Published var games: [Game]?
   
    func searchGames(with name: String) {
    }
    
    func clearGames() {
        games?.removeAll()
    }
    
}
