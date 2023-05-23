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
    case urlSessionError(Error)
    case decodingError(Error)
}


protocol NetworkServiceProtocol {
}


final class NetworkService: NetworkServiceProtocol {
    
    var game: Game?
    
    func fetchGames() async -> Result<GamesResponse, NetworkError> {
        guard let url = URL(string: "https://api.rawg.io/api/games?key=74f86270fe5542fdaa2d8bef8c84bf15") else { return .failure(.invalidURL)}
        
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
    
    func fetchNewGames() async -> Result<GamesResponse, NetworkError> {
        let dates = getDatesForNewGames()
        guard let url = URL(string: "https://api.rawg.io/api/games?key=74f86270fe5542fdaa2d8bef8c84bf15&dates=\(dates)") else { return .failure(.invalidURL)}
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
    
    private func getDatesForNewGames() -> String {
        
        var querryString = ""

        // Создаем форматтер даты
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        // Получаем текущую дату
        let currentDate = Date()

        // Выводим текущую дату
        let currentDateStr = formatter.string(from: currentDate)
        print(currentDateStr) // например "2023-05-23"

        // Создаем календарь
        let calendar = Calendar.current

        // Вычисляем дату месяц назад
        if let oneMonthAgo = calendar.date(byAdding: .month, value: -1, to: currentDate) {
            let oneMonthAgoStr = formatter.string(from: oneMonthAgo)
            querryString =  "\(oneMonthAgoStr),\(currentDateStr)"
        }
        return querryString
 
    }
}



