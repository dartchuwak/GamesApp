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
    //var developer: String { get }
}

class DetailsViewModel: DetailsViewModelProtocol {
    
    @Published var game: Proto_Game?
    var id: UInt64
    @Published var imageURL: String?
    @Published var screenshots: [URL] = []
        
    init (id: UInt64) {
        self.id = id
      //  fetchGame(with: id)
    }
    
    func getDeveloper() -> String {
        guard let game = game else { return ""}
        let developer = game.involvedCompanies.filter{$0.developer == true }
        return developer.first?.company.name ?? ""
    }
    
    func getRating() -> String {
        guard let game = game else { return ""}
        let rating = Int(game.rating)
        return rating.description
    }
    
    
    func fetchGame(with id: UInt64) {
        
        let wrapper: IGDBWrapper = IGDBWrapper(proxyURL: "https://ko3k6htpga.execute-api.us-west-2.amazonaws.com/production/v4", proxyHeaders: ["x-api-key": "ByQqc9u17uvEyvB56YwJa1aMYOPCqj75LPQme8jf"])
        
        let apicalypse = APICalypse()
            .fields(fields: "cover.image_id, name, platforms, summary, websites.url ,websites.category, rating, involved_companies.developer, artworks.image_id, screenshots.image_id")
            .where(query: "id = \(id)")
        
        wrapper.games(apiCalypse: apicalypse, result: { games in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                guard let game = games.first else { print("error"); return }
                self.game = game
                let imageId = game.cover.imageID
                self.imageURL = imageBuilder(imageID: imageId, size: .FHD, imageType: .WEBP)
                fetchScreenshots()
            }
        }) { error in
            // Error handling
            
        }
    }
    
    func fetchScreenshots() {
        for image in game!.screenshots {
            let imageId = image.imageID
            let urlString = imageBuilder(imageID: imageId, size: .SCREENSHOT_BIG, imageType: .WEBP)
             guard let url = URL(string: urlString) else { return }
            screenshots.append(url)
        }
    }
}
