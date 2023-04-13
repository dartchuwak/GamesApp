import SwiftUI

struct GamesView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    @State private var showCancelButton = false
    
    let columns: [GridItem] = [
        GridItem(.fixed(132), spacing: 20),
        GridItem(.fixed(132)),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.games, id: \.self) { game in
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
            .padding(.top)
           
      
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        GamesView(viewModel: MainViewModel())
    }
}
