//
//  DetailsViewModel.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 14.03.2023.
//

import Foundation
import Combine


protocol DetailsViewModelProtocol: ObservableObject {
    var game: GameInfo? { get set }
    var id: String { get set }
    var networkService: NetworkServiceProtocol { get set }
    
}

class DetailsViewModel: DetailsViewModelProtocol, ObservableObject {
    
    @Published var game: GameInfo?
    @Published var screenshots: [Screenshot] = []
    @Published var id = ""
    var networkService: NetworkServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    var priceDifferenceInPercent: Double {
        let basePrice = Double(game!.BasePrice)!
        let salePrice = Double(game!.SalePrice)!
           
           let priceDifference = basePrice - salePrice
           let percentageDifference = (priceDifference / basePrice) * 100

           return percentageDifference
       }
    
    init (id: String, networkService: NetworkServiceProtocol) {
        self.id = id
        self.networkService = networkService
       // searchGame(with: id)
        self.game = gameMock
        self.configureScreenshots()
    }
    
    
    func searchGame(with id: String) {
        networkService.fetchGameDetails(with: id)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(completion)
                    print("Error: \(error.localizedDescription)")
                }
            }, receiveValue: { apiResponse in
                self.game = apiResponse
                self.configureScreenshots()
            })
            .store(in: &cancellables)
    }
    
    func configureScreenshots() {
        guard let game = game else { return }
        self.screenshots.append(Screenshot(id: UUID(), url: game.Screenshot1))
        self.screenshots.append(Screenshot(id: UUID(), url: game.Screenshot2))
        self.screenshots.append(Screenshot(id: UUID(), url: game.Screenshot3))
        self.screenshots.append(Screenshot(id: UUID(), url: game.Screenshot4))
        self.screenshots.append(Screenshot(id: UUID(), url: game.Screenshot5))
        self.screenshots.append(Screenshot(id: UUID(), url: game.Screenshot6))
        self.screenshots.append(Screenshot(id: UUID(), url: game.Screenshot7))
        self.screenshots.append(Screenshot(id: UUID(), url: game.Screenshot8))
        self.screenshots.append(Screenshot(id: UUID(), url: game.Screenshot9))
        
    }
}
