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
    
    var body: some View {
        
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 0)  {
                AsyncImage(url: URL(string: viewModel.game.background_image ?? "")) { image in
                    image.resizable()
                    
                } placeholder: {
                    ProgressView()
                        .frame(width: geo.size.width, height: geo.size.width/2)
                    
                }
                .aspectRatio(contentMode: .fill)
                .frame(width: geo.size.width, height: geo.size.width*2/3)
                .clipped()
                
                VStack(alignment: .leading) {
                    Text(viewModel.game.name)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    
                    Spacer()
                    Text("Ganres: Action")
                        .foregroundColor(.white)
                    if let score = viewModel.game.metacritic {
                        Text("Metascore: \(score)")
                            .foregroundColor(.white)
                    }
                    Text("Release date: \(viewModel.releaseDate)")
                        .foregroundColor(.white)
                }
                .padding()
                
            }
        }
            .frame(width: UIScreen.main.bounds.width - 32, height: UIScreen.main.bounds.width - 32)
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
