//
//  NetworkService.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 13.03.2023.
//

import Foundation
import Combine

enum NetworkError: Error {
    case invalidURL
    case emptyResponse
}


protocol NetworkServiceProtocol {
    func fetchGameDetails(with id:String) -> AnyPublisher<GameDetails, Error>
    func fetchGameScreenshots(with id:String) -> AnyPublisher<ScreenshotsResponse, Error>
    func searchGames(with name: String) ->  AnyPublisher<GamesResponse, Error>
}


final class NetworkService: NetworkServiceProtocol {
   
    
    func fetchGameDetails(with id:String) -> AnyPublisher<GameDetails, Error> {
        let url = URL(string:"https://api.rawg.io/api/games/\(id)?key=74f86270fe5542fdaa2d8bef8c84bf15")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map({$0.data})
            .decode(type: GameDetails.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func fetchGameScreenshots(with id:String) -> AnyPublisher<ScreenshotsResponse, Error> {
        let url = URL(string:"https://api.rawg.io/api/games/\(id)/screenshots?key=74f86270fe5542fdaa2d8bef8c84bf15")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map({$0.data})
            .decode(type: ScreenshotsResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func searchGames(with name: String) -> AnyPublisher<GamesResponse, Error> {
        let nameString = name.replacingOccurrences(of: " ", with: "%20")
        let url = URL(string: "https://api.rawg.io/api/games?key=74f86270fe5542fdaa2d8bef8c84bf15&search=\(nameString)")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map({$0.data})
            .decode(type: GamesResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main )
            .eraseToAnyPublisher()
    }
    
}
