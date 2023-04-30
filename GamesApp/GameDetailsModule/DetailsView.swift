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
            GeometryReader { geo in
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        ZStack {
                            AsyncImage(url: URL(string: viewModel.imageURL ?? "")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                                    .frame(height: 400)
                            }
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width)
                            
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    Text(viewModel.getRating())
                                        .foregroundColor(.red)
                                        .fontWeight(.heavy)
                                        .font(.largeTitle)
                                        .padding()
                                }
                            }
                        }
                        
                        Text(game.name)
                            .padding(.horizontal)
                            .font(.title)
                            .fontWeight(.bold)
                        VStack {
                            Text(viewModel.getDeveloper())
                                .padding(.horizontal)
                                .font(.system(.subheadline))
                                .italic()
                                .fontWeight(.thin)
                        }
                        Text(game.summary)
                            .padding()
                        
                        TabView {
                            ForEach (viewModel.screenshots , id:\.self) { image in
                                AsyncImage(url: image) { image in
                                    image.resizable()
                                        .scaledToFit()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: geo.size.width)
                            }
                            
                        }
                        .tabViewStyle(PageTabViewStyle())
                        .frame(width: geo.size.width, height: 211)
                    }
                }
            }
        } else {
            GeometryReader { geo in
                HStack (spacing: 12) {
                    Text("Загрузка")
                    ProgressView()
                        .navigationBarTitleDisplayMode(.inline)
                }
                .onAppear{
                    viewModel.fetchGame(with: viewModel.id)
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .position(x: geo.size.width * 0.5, y: geo.size.height * 0.5)
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

