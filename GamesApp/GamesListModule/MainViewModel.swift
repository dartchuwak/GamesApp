//
//  MainViewModel.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 13.03.2023.
//

import Foundation
import SwiftUI
import IGDB_SWIFT_API


protocol  MainViewModelProtocol: AnyObject, ObservableObject {
    var games: [Proto_Game] { get set }
    func clearGames()
    func fetchViaAmazonProxy()
}

final class MainViewModel: MainViewModelProtocol {
    @Published var games: [Proto_Game] = []

    
    init () {
        fetchViaAmazonProxy()
    }
     
    func fetchViaAmazonProxy() {
        let wrapper: IGDBWrapper = IGDBWrapper(proxyURL: "https://ko3k6htpga.execute-api.us-west-2.amazonaws.com/production/v4", proxyHeaders: ["x-api-key": "ByQqc9u17uvEyvB56YwJa1aMYOPCqj75LPQme8jf"])
        
        let apicalypse = APICalypse()
            .fields(fields: "cover.image_id, name, rating")
            .where(query: "cover.image_id != null")
           // .where(query: "summary != null")
            //.where(query: "screenshots.url != null")
            .limit(value: 60)
            .sort(field: "rating", order: .DESCENDING)
        
        wrapper.games(apiCalypse: apicalypse, result: { games in
            DispatchQueue.main.async {
                self.games = games
            }
            
            
                
            
        }) { error in
            // Do something..
        }
        
    }
    
    func clearGames() {
        games.removeAll()
    }
}
