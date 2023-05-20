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
        SearchBarView(searchText: $searchText, viewModel: viewModel)
    }
}

struct SearchBarView: View {
    @Binding var searchText: String
    @ObservedObject var viewModel: SearchViewModel
    @State var isAnimating: Bool = false
    @State private var isTextFieldFocused: Bool = false
    
    
    let columns: [GridItem] = [
        GridItem(.fixed(132), spacing: 20),
        GridItem(.fixed(132)),
    ]
    
    func clearGames() {
        viewModel.clearGames()
        searchText = ""
        
    }
    
    var body: some View {
        
        NavigationView {
        
            VStack {
                
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search for games", text: $searchText)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.25)) {
                                isTextFieldFocused = true
                            }
                        }
                        .onChange(of: searchText) { newValue in
                            viewModel.searchGames(with: newValue)
                        }
                    Button(action: clearGames) {
                        Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10.0)
                .padding()
                .frame(height: 88)
                
                Spacer()
                
                if let games = viewModel.games {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(games, id: \.self) { game in
                                NavigationLink(
                                    destination: DetailsView(detailsViewModel: DetailsViewModel(id: game.id)),
                                    label: {
                                        let cellViewModel = CellViewModel(game: game)
                                        MyCellView(viewModel: cellViewModel)
                                    }
                                )
                                .foregroundColor(.black)
                            }
                        }
                    }
                }
            }
        }
        
    }
}


struct SearchView_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        
        SearchView(viewModel: SearchViewModel())
    }
}
