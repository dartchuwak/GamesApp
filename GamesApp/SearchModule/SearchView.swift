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
    var onCancel: () -> Void = {
    }
    
    @State var isAnimating: Bool = false
    
    let columns: [GridItem] = [
        GridItem(.fixed(132), spacing: 20),
        GridItem(.fixed(132)),
    ]
    
    func isAnimatingFunc() {
        isAnimating = true
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search for games", text: $searchText)
                        .onChange(of: searchText) { newValue in
                            withAnimation(.default) {
                                viewModel.searchGames(with: newValue)
                                isAnimating = true
                               
                            }
                        }
                        .onTapGesture {
                            withAnimation(.easeOut) {
                             
                            }
                        }
                    Button(action: isAnimatingFunc) {
                        Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10.0)
                .padding()
               // .transition( isAnimating ? .move(edge: .top) : .move(edge: .bottom))
                
                
                if isAnimating {
                    Spacer()
                }
                
                if let games = viewModel.games {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(games, id: \.self) { game in
                                NavigationLink(
                                    destination: DetailsView(viewModel: DetailsViewModel(id: game.id)),
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
    
    static let ns = NetworkService()
    
    static var previews: some View {
    
        SearchView(viewModel: SearchViewModel())
    }
}
