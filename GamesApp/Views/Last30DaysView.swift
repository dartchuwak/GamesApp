//
//  Last30DaysView.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 23.05.2023.
//

import SwiftUI

struct Last30DaysView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Last 30 Days")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.horizontal)
            ScrollView(.vertical) {
                LazyVStack(spacing: 10) {
                    ForEach(vm.newGames, id: \.self) { game in
                        NavigationLink(destination: {
                            DetailsView(detailsViewModel: DetailsViewModel(id: game.id))
                        }, label: {
                            GameCellView(viewModel: GameCellViewModel(game: game))
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        })
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .background(Color.yellow)
        .onAppear {
            vm.fetchNewGames()
        }
    }
}

struct Last30DaysView_Previews: PreviewProvider {
    static var previews: some View {
        Last30DaysView()
    }
}
