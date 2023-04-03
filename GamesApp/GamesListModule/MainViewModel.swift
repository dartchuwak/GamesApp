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
    func loadDiscounts()
    func clearGames()
}

final class MainViewModel: MainViewModelProtocol {
    @Published var games: [Game] = []
    private let networkService: NetworkServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init (networkService: NetworkServiceProtocol) {
        self.networkService = networkService
        loadDiscounts()
    }
     
    
    func loadDiscounts() {
        networkService.fetchDiscounts()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(completion)
                    print("Error: \(error.localizedDescription)")
                }
            }, receiveValue: { apiResponse in
                self.games = apiResponse.game_discounts
                print("Used \(apiResponse.apiUsage) from \(apiResponse.apiLimit)")
            })
            .store(in: &cancellables)
    }
    
  
 
    

    func clearGames() {
        games.removeAll()
    }
}
