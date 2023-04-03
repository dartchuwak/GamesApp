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
        VStack (spacing: 10) {
            
            AsyncImage(url: URL(string: viewModel.game.Img) ) { image in
                image.resizable()
                
            } placeholder: {
                
                ProgressView()
                    .frame(width: 150, height: 150)
                
            }
            .frame(width: 150)
            .aspectRatio( 1.0, contentMode: .fit)
            //  .scaledToFit()
            
            .clipped()
            .cornerRadius(15)
            HStack{
                Text("-\(viewModel.priceDifferenceInPercent, specifier: "%.0f")%")
                    .padding(4)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .font(.subheadline)
                
                Spacer()
            }
            
            
            HStack {
                Text(viewModel.game.formattedSalePrice)
                Text(viewModel.game.formattedBasePrice)
                    .strikethrough()
                    .foregroundColor(.gray)
                Spacer()
            }
            
        }
        
        .frame(width: 150)
        
    }
    
}

struct MyCellView_Previews: PreviewProvider {
    static var previews: some View {
        MyCellView( viewModel:CellViewModel( game: gameResponse.game_discounts[10]))
    }
}
