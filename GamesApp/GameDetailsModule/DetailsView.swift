//
//  DetailsView.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 13.03.2023.
//

import Foundation
import SwiftUI
import IGDB_SWIFT_API


struct DetailsView: View {
    
    @ObservedObject var viewModel: DetailsViewModel
    
    var body: some View {
        
        if let game = viewModel.game {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: viewModel.imageURL ?? "")) { image in
                        image.resizable()
                        
                    } placeholder: {
                        ProgressView()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 350)
                    }
                    .clipped()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width)
                    .cornerRadius(25)
                
                    Text(game.name)
                        .padding(.horizontal)
                        .font(.title)
                        .fontWeight(.bold)
                    VStack {
                        
                        let comp = game.involvedCompanies.filter{$0.developer == true }
                        Text(comp.first?.company.name ?? "")
                            .padding(.horizontal)
                            .font(.system(.subheadline))
                                .italic()
                                .fontWeight(.thin)
                    }
                    Text(game.rating.description)
                    Text(game.summary)
                        .padding()
                    Text("Where to buy:")
                    Link(destination: URL(string: game.websites.first?.url ?? "")!, label: {
                        Text(game.websites.first?.category.rawValue.description ?? "")
                    })
                }
            }
            
        } else {
            HStack(spacing: 12) {
                Text("Загрузка")
                ProgressView()
                    .navigationBarTitleDisplayMode(.inline)
                
            }
            .onAppear {
                viewModel.fetchGame(with: viewModel.id)
            }
        }
            
    }
}

struct DetailsView_Previews: PreviewProvider {
    
    static let vm = DetailsViewModel(id: 1942)
    
    static var previews: some View {
        DetailsView(viewModel: vm)
            .onAppear {
                vm.fetchGame(with: 1942)
            }
    }
}

