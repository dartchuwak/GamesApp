//
//  SearchViewModel.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 03.04.2023.
//

import Foundation
import Combine

protocol SearchViewModeProtocol: ObservableObject {
    var networkService: NetworkServiceProtocol { get }
    func searchGame(with name: String)
    var game: GameInfo? { get }
}

final class SearchViewModel: SearchViewModeProtocol, ObservableObject {
    
    
    @Published var game: GameInfo?
    let networkService: NetworkServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init ( networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    
    func searchGame(with name: String) {
        networkService.searchGame(with: name)
          //  .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(completion)
                    print("Error: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] apiResponse in
                self?.game = apiResponse
                print(self?.game?.GameName)
                print("Used \(apiResponse.apiUsage) from \(apiResponse.apiLimit)")
            })
            .store(in: &cancellables)
    }

}
