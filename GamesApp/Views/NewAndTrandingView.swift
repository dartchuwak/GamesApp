import SwiftUI

struct NewAndTrandingView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tranding")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.horizontal)
            ScrollView(.vertical) {
                LazyVStack(spacing: 10) {
                    ForEach(vm.games, id: \.self) { game in
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
        .background(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        NewAndTrandingView()
            .environmentObject(ViewModel(networkService: NetworkService()))
    }
}
