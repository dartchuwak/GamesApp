//
//  ApplicationFactory.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 21.03.2023.
//

import Foundation


final class ApplicationFactory {
    
    
    let networkService: NetworkServiceProtocol
    
    var mainViewModel: ViewModel {
        return ViewModel()
    }
    
    var searchViewModel: SearchViewModel {
        return SearchViewModel()
    }
    
    
    init() {
        self.networkService = NetworkService()
    }
}
