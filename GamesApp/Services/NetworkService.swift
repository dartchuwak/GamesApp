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
    func fetchDiscounts() -> AnyPublisher<GameDiscountsResponse, Error>
    func fetchGameDetails(with id: String) -> AnyPublisher<GameInfo, Error>
    func searchGame(with name: String) -> AnyPublisher<GameInfo, Error>
}


final class NetworkService: NetworkServiceProtocol {
       
    func fetchDiscounts() -> AnyPublisher<GameDiscountsResponse, Error> {
        let urlString = "https://platprices.com/api.php?key=6Kk4norkUTfFEXyIVQEL9Q0ZGUugCkRg&sale=441"

        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: GameDiscountsResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func fetchGameDetails(with id: String) -> AnyPublisher<GameInfo, Error> {
        let urlString = "https://platprices.com/api.php?key=6Kk4norkUTfFEXyIVQEL9Q0ZGUugCkRg&ppid=\(id)"

        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: GameInfo.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func searchGame(with name: String) -> AnyPublisher<GameInfo, Error> {
        let name = name.replacingOccurrences(of: " ", with: "%20")
        let urlString = "https://platprices.com/api.php?key=6Kk4norkUTfFEXyIVQEL9Q0ZGUugCkRg&name=\(name)"

        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            //.debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .decode(type: GameInfo.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func fetchDiscounts() -> AnyPublisher<DiscountsResponse, Error> {
        let urlString = "https://platprices.com/api.php?key=6Kk4norkUTfFEXyIVQEL9Q0ZGUugCkRg&sales=1"

        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            //.debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .decode(type: DiscountsResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}



