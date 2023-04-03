//
//  SearchView.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 03.04.2023.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    @State private var searchText = ""
    
    var body: some View {
        
        SearchBarView(searchText: $searchText, viewModel: viewModel) {
            self.searchText = ""
           // viewModel.games = []
        }
    }
}

struct SearchBarView: View {
    @Binding var searchText: String
    var viewModel: SearchViewModel
    var onCancel: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search for games", text: $searchText)
                    .onChange(of: searchText) { newValue in
                        viewModel.searchGame(with: newValue)
                    }
                Button(action: onCancel) {
                    Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                }
            }
            .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)
            .padding()
            
            if let game = viewModel.game {
                Text(game.GameName)
            }
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    
    static let ns = NetworkService()
    
    static var previews: some View {
    
        SearchView(viewModel: SearchViewModel(networkService: ns))
    }
}
