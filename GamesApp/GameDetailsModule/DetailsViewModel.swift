//
//  DetailsViewModel.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 14.03.2023.
//

import Foundation
import Combine


protocol DetailsViewModelProtocol: ObservableObject {
    var gameDetails: GameDetails? { get set }
    var id: Int { get set }
    var networkService: NetworkServiceProtocol { get set }
    func fetchGameDetails(with id: String)
    func fetchGameScreenshots( with id: String)
}

class DetailsViewModel: DetailsViewModelProtocol, ObservableObject {
    
    @Published var gameDetails: GameDetails?
    @Published var gameScreenshots: [Screenshot] = []
    @Published var gameTrailer: URL?
    @Published var id = 0
    var networkService: NetworkServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init (id: Int, networkService: NetworkServiceProtocol) {
        self.id = id
        self.networkService = networkService
        fetchGameDetails(with: String(id))
        fetchGameScreenshots(with: String(id))
       // fetchTrailer(with: String(id))
    }
    
    func fetchGameDetails(with id: String) {
        self.networkService.fetchGameDetails(with: id)
            .sink { _ in
            } receiveValue: { [weak self] response in
                self?.gameDetails = response
            }
            .store(in: &cancellables)
    }
    
    func fetchGameScreenshots(with id: String) {
        self.networkService.fetchGameScreenshots(with: id)
            .sink { _ in
        } receiveValue: { [weak self] response in
            self?.gameScreenshots = response.results
        }
        .store(in: &cancellables)
    }
    
//    func fetchTrailer(with id: String) {
//        self.networkService.fetchTrailer(with: id)
//            .sink { _ in
//        } receiveValue: { [weak self] response in
//            self?.gameTrailer = URL(string: (response.results.first?.data.max)!)
//        }
//        .store(in: &cancellables)
//    }
}
