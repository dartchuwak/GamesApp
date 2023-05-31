//
//  ApplicationFactory.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 21.03.2023.
//

import Foundation


final class ApplicationFactory {
    
    
    let networkService: NetworkService
    
    var mainViewModel: ViewModel {
        return ViewModel(networkService: networkService)
    }
    
    
    init() {
        self.networkService = NetworkService()
    }
}
