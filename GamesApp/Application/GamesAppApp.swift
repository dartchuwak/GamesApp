//
//  GamePriceApp.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 11.03.2023.
//
import SwiftUI

@main
struct GamePriceApp: App {
    
    @StateObject var vm = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ScreenFactory.instance.makeTabViewScreen()
                .environmentObject(vm)
        }
    }
    
}

