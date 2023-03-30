//
//  MyCellView.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 13.03.2023.
//

import Foundation
import SwiftUI


struct MyCellView: View {
    
    @ObservedObject var viewModel: CellViewModel
    
    var body: some View {
        VStack (alignment: .center) {
            //
            AsyncImage(url: URL(string: viewModel.game.background_image ?? "") ) { image in
                image.resizable()
                
            } placeholder: {
                ProgressView()
            }
            .frame(width: UIScreen.main.bounds.width-24, height: (UIScreen.main.bounds.width-24)/1.77)
            .scaledToFill()
            .clipped()
            //
            //
            HStack {
                Text(viewModel.game.name ?? "No name")
                    .multilineTextAlignment(.center)
            }
        }
        .background(Color.orange)
        .cornerRadius(15)
        .frame(width: UIScreen.main.bounds.width-24)
        .padding()
        
    }
}

struct MyCellView_Previews: PreviewProvider {
    static var previews: some View {
        MyCellView( viewModel:CellViewModel( game: gameResponce.first!))
    }
}
