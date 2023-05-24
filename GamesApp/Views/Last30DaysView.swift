//
//  Last30DaysView.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 23.05.2023.
//

import SwiftUI

struct Last30DaysView: View {
    
    @EnvironmentObject var vm: ViewModel
    @Environment(\.colorScheme) var colorScheme
    @State var selectedOrder: SortOrders = .popularity
    @State var selectedPlatform: FilterPlatforms = .pc
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Last 30 Days")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.horizontal)
            
            FilterView(selectedOrder: $selectedOrder, selectedPlatform: $selectedPlatform)
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 10) {
                    ForEach(vm.last30DaysGames, id: \.self) { game in
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
            vm.fetchLast30DaysGames()
        }
    }
}

struct Last30DaysView_Previews: PreviewProvider {
    static var previews: some View {
        Last30DaysView()
            .environmentObject(ViewModel(networkService: NetworkService()))
    }
}
