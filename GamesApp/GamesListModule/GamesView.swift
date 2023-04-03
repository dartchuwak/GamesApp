import SwiftUI

struct GamesView: View {
    
    @ObservedObject var viewModel: MainViewModel
   
    @State private var showCancelButton = false
  //  @State var games: [Game] = []
    
    let columns: [GridItem] = [
        GridItem(.fixed(150), spacing: 20),
        GridItem(.fixed(150)),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                  
                    ForEach(viewModel.games, id: \.self) { game in
                            NavigationLink(
                                destination: DetailsView(viewModel: DetailsViewModel(id: game.PPID, networkService: NetworkService())),
                                label: {
                                    let cellViewModel = CellViewModel(game: game)
                                    MyCellView(viewModel: cellViewModel)
                                }
                            )
                            .foregroundColor(.black)
                        }
                    
                }
            }
            .navigationTitle("Games deals")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static let ns = NetworkService()
    static var previews: some View {
        GamesView(viewModel: MainViewModel(networkService: ns))
    }
}
