//
//  ContentView.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 11.03.2023.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    @State private var searchText = ""
    @State private var showCancelButton = false
    @State var games: [Game] = []
    
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(searchText: $searchText, viewModel: viewModel) {
                    self.searchText = ""
                    viewModel.games = []
                }
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.games, id: \.self) { game in
                            NavigationLink {
                                DetailsView(viewModel: DetailsViewModel(id: game.id!, networkService: NetworkService()))
                            }
                        label: {
                                    let cellViewModel = CellViewModel(game: game)
                                    MyCellView(viewModel: cellViewModel)
                            }
                            .foregroundColor(.black)
                        }
                    }
                }
            }
            .background(Color.yellow)
        }.navigationTitle("Games")
    }
}

struct SearchBarView: View {
    @Binding var searchText: String
    var viewModel: MainViewModel
    var onCancel: () -> Void
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search for games", text: $searchText)
                .onChange(of: searchText) { newValue in
                    viewModel.loadGames(with: newValue)
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
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static let ns = NetworkService()
    static var previews: some View {
        MainView(viewModel: MainViewModel(networkService: ns))
    }
}
