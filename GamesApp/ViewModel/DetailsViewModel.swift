//
//  DetailsViewModel.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 14.03.2023.
//

import Foundation

class DetailsViewModel: ObservableObject {
    
    let networkService: NetworkService
    var id: Int
    @Published var game: GameDetails?
    
    
        
    init (id: Int, networkService: NetworkService) {
        self.networkService = networkService
        self.id = id
    }
    
    
    func fetchGame(with id: Int) {
        Task {
            let result = await networkService.fetchGameDetails(with: id)
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
    
    func getDescription( text: String) -> String {
        return text.htmlAttributedString() ?? ""
    }
}
