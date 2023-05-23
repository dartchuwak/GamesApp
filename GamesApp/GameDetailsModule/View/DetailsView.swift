//
//  DetailsView.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 13.03.2023.
//

import Foundation
import SwiftUI


struct DetailsView: View {
    
    @StateObject var detailsViewModel: DetailsViewModel
    @EnvironmentObject var viewmodel: ViewModel
    @State var isFavorite: Bool = false
    
    var body: some View {
        
        if let game = detailsViewModel.game {
            GeometryReader { geo in
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        ZStack {
                            AsyncImage(url: URL(string: game.background_image ?? "")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                                    .frame(height: 400)
                            }
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width)
                        }
                        
                        Text(game.name)
                            .padding(.horizontal)
                            .font(.title)
                            .fontWeight(.heavy)
                        
                        Text("About")
                            .font(.title)
                            .padding(.horizontal)
                        ScrollView {
                            Text(game.description_raw ?? "")
                        }
                        .frame(height: 300)
                        .padding(.horizontal)
                        
                    }
                }
            }
        } else {
            GeometryReader { geo in
                HStack (spacing: 12) {
                    Text("Loading")
                    ProgressView()
                        .navigationBarTitleDisplayMode(.inline)
                }
                .onAppear {
                    detailsViewModel.fetchGame(with: detailsViewModel.id)
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .position(x: geo.size.width * 0.5, y: geo.size.height * 0.5)
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    
    static let vm = DetailsViewModel(id: 2454)
    static var previews: some View {
        DetailsView(detailsViewModel: vm)
            .onAppear{
                vm.fetchGame(with: 2454)
            }
    }
}

