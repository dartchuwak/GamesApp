//
//  DetailsView.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 13.03.2023.
//

import Foundation
import SwiftUI
import AVKit


struct DetailsView: View {
    
    @StateObject var viewModel: DetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                AsyncImage(url: URL(string: (viewModel.gameDetails?.background_image) ?? "" )) { image in
                    image.resizable()
            
                } placeholder: {
                    ProgressView()
                }
                .frame(width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds).width/1.55)
                .scaledToFit()
                HStack {
                    if let gameDetails = viewModel.gameDetails {
                        Text(gameDetails.name)
                            .font(.title)
                        Spacer()
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
             
                HStack {
                    Text("Realesed at: \(viewModel.gameDetails?.released ?? "")")
                        .foregroundColor(Color.gray)
                    Spacer()
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                //
                //AddToFavorites(viewModel: viewModel)
                //
                Group {
                    
                    Text(viewModel.gameDetails?.description ?? "")
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    
                }
                
                HStack {
                    Text("Screenshots:")
                        .padding()
                        .font(.headline)
                    Spacer()
                }
                //
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 12) {
                        ForEach((viewModel.gameScreenshots), id: \.self) { item in
                            AsyncImage(url: URL(string: item.image )) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: UIScreen.main.bounds.width-24, height: (UIScreen.main.bounds.width-24)/1.77)
                            .cornerRadius(25)
                        }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 12))
                    }
                    //
                    .onAppear {
                        UIScrollView.appearance().isPagingEnabled = true
                    }
                    .padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 0))
                }
                Spacer()
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(viewModel: DetailsViewModel(id: 2454, networkService: NetworkService()))
    }
}




