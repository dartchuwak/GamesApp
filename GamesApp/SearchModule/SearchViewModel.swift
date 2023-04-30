//
//  SearchViewModel.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 03.04.2023.
//

import Foundation
import Combine
import IGDB_SWIFT_API

protocol SearchViewModeProtocol: ObservableObject {
    func searchGames(with name: String)
    var games: [Proto_Game]? { get }
}

final class SearchViewModel: SearchViewModeProtocol, ObservableObject {
    
    
    @Published var games: [Proto_Game]?
   
  
    
   
    
    
    func searchGames(with name: String) {
        
        let wrapper: IGDBWrapper = IGDBWrapper(proxyURL: "https://ko3k6htpga.execute-api.us-west-2.amazonaws.com/production/v4", proxyHeaders: ["x-api-key": "ByQqc9u17uvEyvB56YwJa1aMYOPCqj75LPQme8jf"])
        
        let apicalypse = APICalypse()
            .fields(fields: "cover.image_id, name, platforms, summary, name")
            .where(query: "cover.image_id != null")
            .search(searchQuery: name)
            .limit(value: 20)
        
        
        wrapper.games(apiCalypse: apicalypse, result: { games in
            DispatchQueue.main.async { [weak self] in
                self?.games = games
            }
        }) { error in
            // Error handling
            
        }
    }
    
    func clearGames() {
        games?.removeAll()
    }
    
}
