//
//  DetailsViewModel.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 14.03.2023.
//

import Foundation

class DetailsViewModel: ObservableObject {
    
    let networkManager: NetworkService = NetworkService()
    var id: Int
    @Published var game: GameDetails?
        
    init (id: Int) {
        self.id = id
    }
    
    
    func fetchGame(with id: Int) {
        Task {
            let result = await networkManager.fetchGameDetails(with: id)
            switch result {
            case .success(let result):
                DispatchQueue.main.async {
                    self.game = result
                }
            case .failure(let error):
                print (error)
            }
        }
    }
}
