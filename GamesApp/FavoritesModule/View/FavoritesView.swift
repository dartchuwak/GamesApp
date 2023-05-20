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
        List {
            ForEach (viewModel.favoriteGames, id: \.self) { id in
                Text(id.description)
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
