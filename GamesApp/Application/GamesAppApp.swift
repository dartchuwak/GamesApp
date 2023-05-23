//
//  GamePriceApp.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 11.03.2023.
//
import SwiftUI

@main
struct GamePriceApp: App {

    let applicationFactory = ApplicationFactory()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(applicationFactory.mainViewModel)
               
        }
    }
    
}

