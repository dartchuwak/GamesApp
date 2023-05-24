//
//  MainViewModel.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 13.03.2023.
//

import Foundation
import SwiftUI




final class ViewModel: ObservableObject {
    
    let networkService: NetworkService
    
    @Published var games: [Game] = []
    @Published var newGames: [Game] = []
    @Published var favoriteGames: [String] = []
    
    
    init (networkService: NetworkService) {
        self.networkService = networkService
        fetchGames()
      //  fetchNewGames()
    }
    
    func fetchGames() {
        Task {
            let result = await networkService.fetchGames()
            switch result {
            case .success(let resonse):
                DispatchQueue.main.async {
                    self.games = resonse.results
                }
            case .failure(let error):
                print (error)
            }
        }
    }
    
    func fetchNewGames() {
        
        Task {
            let result = await networkService.fetchNewGames()
            switch result {
            case .success(let resonse):
                DispatchQueue.main.async {
                    self.newGames = resonse.results
                }
            case .failure(let error):
                print (error)
            }
        }
    }
    
    func clearGames() {
        games.removeAll()
    }
    
    func addToFavorites(id: String) {
        if favoriteGames.contains(id){
            favoriteGames.removeAll(where: { $0 == id})
        } else {
            favoriteGames.append(id)
        }
        
    }
    

}
