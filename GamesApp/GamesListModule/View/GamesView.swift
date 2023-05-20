import SwiftUI

struct GamesView: View {
    
    @EnvironmentObject var vm: ViewModel
    @State var isFetched = false
    
    let columns: [GridItem] = [
        GridItem(.fixed(132), spacing: 20),
        GridItem(.fixed(132)),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(vm.games, id: \.self) { game in
                        NavigationLink(destination: {
                            DetailsView(detailsViewModel: DetailsViewModel(id: game.id))
                        }, label: {
                            MyCellView(viewModel: CellViewModel(game: game))
                        })
                    }
                }
            }
            .padding(.top)
        }
        .onAppear {
            if !isFetched {
                print ("Appear")
                vm.fetchGames()
                isFetched = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        GamesView()
    }
}
