import SwiftUI

struct GamesView: View {
    
    @EnvironmentObject var vm: ViewModel
    @State var isFetched = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Top")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                            .foregroundColor(.black)
                        
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: 0) {
                                ForEach(vm.games, id: \.self) { game in
                                    NavigationLink(destination: {
                                        DetailsView(detailsViewModel: DetailsViewModel(id: game.id))
                                    }, label: {
                                        GameCellView(viewModel: GameCellViewModel(game: game))
                                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                                    })
                                }
                            }
                        }
                        .frame(height: UIScreen.main.bounds.width)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("New Releases")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                            .foregroundColor(.black)
                        
                        ScrollView(.horizontal) {
                            LazyHStack {
                                ForEach(vm.newGames, id: \.self) { game in
                                    NavigationLink(destination: {
                                        DetailsView(detailsViewModel: DetailsViewModel(id: game.id))
                                    }, label: {
                                        GameCellView(viewModel: GameCellViewModel(game: game))
                                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        
                                    })
                                }
                            }
                        }
                        .frame(height: UIScreen.main.bounds.width)
                    }
                }
            }
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        GamesView()
            .environmentObject(ViewModel(networkService: NetworkService()))
    }
}
