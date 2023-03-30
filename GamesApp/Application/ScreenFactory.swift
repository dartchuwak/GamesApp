//
//  ScreenFactory.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 21.03.2023.
//

import Foundation


let screenFactory = ScreenFactory()

final class ScreenFactory {
    
    fileprivate let applicationFactory = ApplicationFactory()
    fileprivate init() {
    }
    
    func makeMainScreen() -> MainView {
        return MainView(viewModel: applicationFactory.mainViewModel as! MainViewModel)
    }

    
}
