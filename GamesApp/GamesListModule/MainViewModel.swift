//
//  MainViewModel.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 13.03.2023.
//

import Foundation
import SwiftUI
import Combine


protocol  MainViewModelProtocol: AnyObject, ObservableObject {
    var games: [Game] { get set }
    func loadGames(with name: String)
    func clearGames()
}

final class MainViewModel: MainViewModelProtocol {
    @Published var games: [Game] = []
    private let networkService: NetworkServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init (networkService: NetworkServiceProtocol) {
        self.networkService = networkService
        loadGames(with: "Doom")
    }
     
    func loadGames(with name: String) {
        Just(name)
            .flatMap { [weak self] name -> AnyPublisher<GamesResponse, Error> in
                guard let self = self else {
                    return Empty().eraseToAnyPublisher()
                }
                return self.networkService.searchGames(with: name)
            }
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] response in
                    let games = response.results ?? []
                    self?.games = games.sorted { $0.rating_top > $1.rating_top }
                }
            )
            .store(in: &cancellables)
    }


    
    func clearGames() {
        games.removeAll()
    }
}
