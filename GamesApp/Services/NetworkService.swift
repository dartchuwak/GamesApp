//
//  NetworkService.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 13.03.2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case emptyResponse
    case urlSessionError(Error)
    case decodingError(Error)
}


protocol NetworkServiceProtocol {
    func fetchGames(with url: String) async -> Result<GamesResponse, NetworkError>
    func fetchGameDetails(with id: Int) async -> Result<GameDetails, NetworkError>
}

final class NetworkService: NetworkServiceProtocol {
    
    func fetchGames(with url: String) async -> Result<GamesResponse, NetworkError> {
        guard let url = URL(string: url) else { return .failure(.invalidURL)}
        print(url)
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let gameResponse = try JSONDecoder().decode(GamesResponse.self, from: data)
            return .success(gameResponse)
        } catch {
            if let urlError = error as? URLError {
                return .failure(.urlSessionError(urlError))
            } else {
                return .failure(.decodingError(error))
            }
        }
    }
    
    func fetchGameDetails(with id: Int) async -> Result<GameDetails, NetworkError> {
        
        guard let url = URL(string: "https://api.rawg.io/api/games/\(id)?key=74f86270fe5542fdaa2d8bef8c84bf15") else { return .failure(.invalidURL)}
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let gameResponse = try JSONDecoder().decode(GameDetails.self, from: data)
            return .success(gameResponse)
        } catch {
            if let urlError = error as? URLError {
                return .failure(.urlSessionError(urlError))
            } else {
                return .failure(.decodingError(error))
            }
        }
    }
}



