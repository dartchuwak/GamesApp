//
//  NextWeekView.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 23.05.2023.
//

import SwiftUI

import SwiftUI

struct NextWeekView: View {
    
    @EnvironmentObject var vm: ViewModel
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Next week")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.horizontal)
            ScrollView(.vertical) {
                LazyVStack(spacing: 10) {
                    ForEach(vm.nextWeekGames, id: \.self) { game in
                        NavigationLink(destination: {
                            DetailsView(detailsViewModel: DetailsViewModel(id: game.id, networkService: vm.networkService))
                        }, label: {
                            GameCellView(viewModel: GameCellViewModel(game: game))
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        })
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .background(colorScheme == .dark ? Color.black : Color.white)
        .onAppear {
            vm.fetchNextWeekGames()
        }
    }
}

struct NextWeekView_Previews: PreviewProvider {
    static var previews: some View {
        NextWeekView()
            .environmentObject(ViewModel(networkService: NetworkService()))
    }
}
