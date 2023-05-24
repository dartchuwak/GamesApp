import SwiftUI

struct NewAndTrandingView: View {
    
    @EnvironmentObject var vm: ViewModel
    @Environment(\.colorScheme) var colorScheme
    @State var selectedOrder = SortOrders.popularity
    @State var selectedPlatform = FilterPlatforms.pc
    @State var isLoading: Bool = true
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Tranding and New")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.horizontal)
                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            
            FilterView(selectedOrder: $selectedOrder, selectedPlatform: $selectedPlatform, forView: .newAndTrending)
            
            
            ZStack {
                ScrollView(.vertical) {
                    LazyVStack(spacing: 10) {
                        ForEach(vm.games, id: \.self) { game in
                            NavigationLink(destination: {
                                DetailsView(detailsViewModel: DetailsViewModel(id: game.id, networkService: vm.networkService))
                            }, label: {
                                GameCellView(viewModel: GameCellViewModel(game: game))
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            })
                        }
                    }
                }
                if vm.isLoading {
                  CircleColors()
                }
            }
        }
        .navigationBarBackButtonHidden()
        .background(colorScheme == .dark ? Color.black : Color.white)
        .onAppear {
            vm.fetchNewAndTrandingGames()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        NewAndTrandingView()
            .environmentObject(ViewModel(networkService: NetworkService()))
    }
}

