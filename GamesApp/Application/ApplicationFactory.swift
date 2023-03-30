//
//  ApplicationFactory.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 21.03.2023.
//

import Foundation


final class ApplicationFactory {
    
    
    let networkService: NetworkServiceProtocol
    
    var mainViewModel: any MainViewModelProtocol {
        return MainViewModel(networkService: networkService)
    }
    
    
    init() {
        self.networkService = NetworkService()
    }
}
