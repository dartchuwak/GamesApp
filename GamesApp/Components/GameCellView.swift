//
//  MyCellView.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 13.03.2023.
//

import Foundation
import SwiftUI


struct GameCellView: View {
    
    @ObservedObject var viewModel: GameCellViewModel
    @State var isLoading: Bool = true
    
    var body: some View {
        
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 8)  {
                AsyncImage(url: URL(string: viewModel.game.background_image ?? "")) { image in
                    image.resizable()
                    
                } placeholder: {
                    ProgressView()
                        .foregroundColor(Color.white)
                        .frame(width: geo.size.width, height: geo.size.width/2)
                }
                .aspectRatio(contentMode: .fill)
                .frame(width: geo.size.width, height: geo.size.width*2/3)
                .clipped()
                
                VStack(alignment: .leading , spacing: 0) {
                    //Game titile
                    Text(viewModel.game.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .lineLimit(1)
                    //Platforms
                    
//                    if let platforms = viewModel.game.platforms {
//                        ScrollView (.horizontal) {
//                            HStack {
//                                ForEach(platforms, id: \.self) { platform in
//                                    if let platformName = platform.platform?.name {
//                                        Image(platformName)
//                                    }
//                                }
//                            }
//                        }
//                        .menuIndicator(.hidden)
//                    }
                    
                    // Game ganres
                    Text("Ganres: Action")
                        .foregroundColor(.white)
                    if let score = viewModel.game.metacritic {
                        Text("Metascore: \(score)")
                            .foregroundColor(.white)
                    }
                    Text("Release date: \(viewModel.releaseDate)")
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                
            }
        }
        .frame(width: UIScreen.main.bounds.width - 16, height: UIScreen.main.bounds.width - 16)
        .background(Color(white: 0.15))
        .cornerRadius(15)
    }
}

struct MyCellView_Previews: PreviewProvider {
    
    static let vm = ViewModel(networkService: NetworkService())
    static var previews: some View {
        GameCellView(viewModel: GameCellViewModel(game: mockGame))
    }
}
