//
//  top250View.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 24.05.2023.
//

import SwiftUI

struct Top250View: View {
    @EnvironmentObject var vm: ViewModel
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("TOP 250")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.horizontal)
                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            ScrollView(.vertical) {
                LazyVStack(spacing: 10) {
                    ForEach(vm.top250, id: \.self) { game in
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
        .onAppear {
            vm.fetchTop250Games()
        }
        .navigationBarBackButtonHidden()
        .background(colorScheme == .dark ? Color.black : Color.white)

    }
}

struct top250View_Previews: PreviewProvider {
    static var previews: some View {
        Top250View()
            .environmentObject(ViewModel(networkService: NetworkService()))
    }
}
