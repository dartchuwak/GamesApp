//
//  DetailsViewModel.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 14.03.2023.
//

import Foundation
import IGDB_SWIFT_API

protocol DetailsViewModelProtocol: AnyObject, ObservableObject {
    var game: Proto_Game? { get set }
    var id: UInt64 { get set }
    var imageURL: String? { get }
}

class DetailsViewModel: DetailsViewModelProtocol {
    
    @Published var game: Proto_Game?
    @Published var id: UInt64
    @Published var imageURL: String?
    
    
    var developer: String = ""
    
    init (id: UInt64) {
        self.id = id
    }
    
    
    
    func fetchGame(with id: UInt64) {
        
        let wrapper: IGDBWrapper = IGDBWrapper(proxyURL: "https://ko3k6htpga.execute-api.us-west-2.amazonaws.com/production/v4", proxyHeaders: ["x-api-key": "ByQqc9u17uvEyvB56YwJa1aMYOPCqj75LPQme8jf"])
        
        let apicalypse = APICalypse()
            .fields(fields: "cover.image_id, name, platforms, summary, websites.url ,websites.category, rating, involved_companies.company.name, involved_companies.developer, artworks.image_id")
            .where(query: "id = \(id)")
        
        wrapper.games(apiCalypse: apicalypse, result: { games in
            DispatchQueue.main.async { [weak self] in
                self?.game = games.first
                let image_id = self?.game?.cover.imageID
                self?.imageURL = imageBuilder(imageID: image_id ?? "", size: .FHD, imageType: .WEBP)
            }
        }) { error in
            // Error handling
            
        }
    }
}
