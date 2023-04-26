//
//  MyCellView.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 13.03.2023.
//

import Foundation
import SwiftUI
import IGDB_SWIFT_API


struct MyCellView: View {
    
    @ObservedObject var viewModel: CellViewModel
    
    var body: some View {
        VStack (spacing: 10) {
            
            AsyncImage(url: URL(string: viewModel.imageURL ?? "")) { image in
                image.resizable()
                
            } placeholder: {
                
                ProgressView()
                    .frame(width: 132, height: 175)
                
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 132)
           
            

           .cornerRadius(15)
        }
        .aspectRatio(contentMode: .fit)
        
      //  .cornerRadius(15)
}

}

struct MyCellView_Previews: PreviewProvider {
    
    let vm = MainViewModel()

    
    static var previews: some View {
        MyCellView( viewModel:CellViewModel( game: Proto_Game()))
    }
}
