//
//  FavoritesView.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 07.05.2023.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        Text("Favorites")
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(ViewModel(networkService: NetworkService()))
    }
}
