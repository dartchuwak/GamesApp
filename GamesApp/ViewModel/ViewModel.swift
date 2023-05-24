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
    @Published var last30DaysGames: [Game] = []
    @Published var nextWeekGames: [Game] = []
    @Published var top250: [Game] = []
    var isLoading: Bool = true
    
    var sortOption: String = ""
    
    
    init (networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchNewAndTrandingGames() {
        Task {
            let result = await networkService.fetchGames(with: "https://api.rawg.io/api/games?key=74f86270fe5542fdaa2d8bef8c84bf15&ordering=\(sortOption)")
            switch result {
            case .success(let resonse):
                DispatchQueue.main.async {
                    self.games = resonse.results
                    self.isLoading = false
                }
            case .failure(let error):
                print (error)
            }
        }
    }
    
    func fetchLast30DaysGames() {
        
        let dates = getDatesForNewGames(from: Date(), value: -1, period: .month)
        Task {
            let result = await networkService.fetchGames(with: "https://api.rawg.io/api/games?key=74f86270fe5542fdaa2d8bef8c84bf15&dates=\(dates)&ordering=\(sortOption)")
            switch result {
            case .success(let resonse):
                DispatchQueue.main.async {
                    self.last30DaysGames = resonse.results
                    
                }
            case .failure(let error):
                print (error)
            }
        }
    }
    
    func fetchNextWeekGames() {
        
        let dates = getDatesForNewGames(from: Date(), value: 1, period: .weekOfMonth)
        Task {
            let result = await networkService.fetchGames(with: "https://api.rawg.io/api/games?key=74f86270fe5542fdaa2d8bef8c84bf15&dates=\(dates)&ordering=\(sortOption)")
            switch result {
            case .success(let resonse):
                DispatchQueue.main.async {
                    self.nextWeekGames = resonse.results
                }
            case .failure(let error):
                print (error)
            }
        }
    }
    
    func fetchTopGamesInYear() {
        Task {
            let result = await networkService.fetchGames(with: "https://api.rawg.io/api/games?key=74f86270fe5542fdaa2d8bef8c84bf15&dates=2001-01-01,2001-12-31&ordering=\(sortOption)")
            switch result {
            case .success(let resonse):
                DispatchQueue.main.async {
                    self.top250 = resonse.results
                }
            case .failure(let error):
                print (error)
            }
        }
        
    }
    
    func fetchTop250Games() {
        Task {
            let result = await networkService.fetchGames(with: "https://api.rawg.io/api/games?key=74f86270fe5542fdaa2d8bef8c84bf15&ordering=\(sortOption)&dates=1970-01-01,2022-12-31&page_size=250")
            switch result {
            case .success(let resonse):
                DispatchQueue.main.async {
                    self.top250 = resonse.results
                }
            case .failure(let error):
                print (error)
            }
        }
        
    }
    
    func handleSelectionChange(option: SortOrders, forView: ViewsEnum ) {
       // print("DEBUG -- Selected Option: \(option.ordersQuerry)")
        sortOption = option.ordersQuerry
        switch forView {
        case .newAndTrending:
            fetchNewAndTrandingGames()
        case .last30Days:
            fetchLast30DaysGames()
        case .nextWeekGames:
            fetchNextWeekGames()
        case .thisWeekGames:
            print("thisWeekGames")
        case .top250:
            fetchTop250Games()
        }
        

        
    }
    
    
    
    private func getDatesForNewGames(from: Date, value: Int, period: Calendar.Component) -> String {
        
        var querryString = ""
        
        // Создаем форматтер даты
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        // Получаем текущую дату
        let firstDate = from
        let firstDateString = formatter.string(from: firstDate)
        
        // Создаем календарь
        let calendar = Calendar.current
        
        // Вычисляем дату месяц назад
        
        if value < 0 {
            if let secondDate = calendar.date(byAdding: period, value: value, to: firstDate) {
                let secondDateString = formatter.string(from: secondDate)
                querryString =  "\(secondDateString),\(firstDateString)"
            }
        } else {
            if let secondDate = calendar.date(byAdding: period, value: value, to: firstDate) {
                let secondDateString = formatter.string(from: secondDate)
                querryString =  "\(firstDateString),\(secondDateString)"
            }
        }
        return querryString
    }
    
    func clearGames(forView: ViewsEnum) {
        switch forView {
        case .newAndTrending:
            games.removeAll()
        case .last30Days:
            last30DaysGames.removeAll()
        case .nextWeekGames:
            nextWeekGames.removeAll()
        case .thisWeekGames:
            games.removeAll() // Fix
        case .top250:
            top250.removeAll()
        }
        
        
    }
    
    
    
}

enum SortOrders: String, CaseIterable {
    case popularity
    case releaseDateAscending
    case releaseDateDescending
    case nameAscending
    case nameDescending
    case metacriticAscending
    case metacriticDescending
    case ratingAscending
    case ratingDescending
    
    var ordersTitle: String {
        switch self {
        case .popularity: return "Popularity"
        case .releaseDateAscending: return "Release date"
        case .releaseDateDescending: return "Release date"
        case .nameAscending: return "Name"
        case .nameDescending: return "Name"
        case .metacriticAscending: return "Metascore"
        case .metacriticDescending: return "Metascore"
        case .ratingAscending: return "Rating"
        case .ratingDescending: return "Rating"
        }
    }
    
    var ordersOrder: String {
        switch self {
        case .popularity: return ""
        case .releaseDateAscending: return "arrow.up"
        case .releaseDateDescending: return "arrow.down"
        case .nameAscending: return "arrow.up"
        case .nameDescending: return "arrow.down"
        case .metacriticAscending: return "arrow.up"
        case .metacriticDescending: return "arrow.down"
        case .ratingAscending: return "arrow.up"
        case .ratingDescending: return "arrow.down"
        }
    }
    
    var ordersQuerry: String {
        switch self {
        case .popularity: return ""
        case .releaseDateAscending: return "released"
        case .releaseDateDescending: return "-released"
        case .nameAscending: return "name"
        case .nameDescending : return "-name"
        case .metacriticAscending: return "metacritic"
        case .metacriticDescending: return "-metacritic"
        case .ratingAscending: return "rating"
        case .ratingDescending: return "-rating"
        }
    }
}

enum FilterPlatforms: String, CaseIterable {
    case pc
    case ps
    
    var platformsTitles: String {
        switch self {
        case .pc: return "PC"
        case .ps: return "Playstation 5"
        }
    }
    
    var platfromsQuerry: String {
        switch self {
        case .pc: return "pc"
        case .ps: return "ps"
        }
    }
}

enum ViewsEnum: String, CaseIterable {
    case newAndTrending
    case last30Days
    case nextWeekGames
    case thisWeekGames
    case top250
}
