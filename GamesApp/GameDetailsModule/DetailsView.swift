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
        
        if let game = viewModel.game {
            GeometryReader { geo in
                ScrollView {
                    VStack(alignment: .center, spacing: 12) {
                        ZStack {
                            ImageView(geo: geo, game: game)
                            // Text(game.PSPPremium)
                        }
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            HStack {
                                Text(game.ProductName.uppercased())
                                    .font(.body)
                                Spacer()
                            }
                            .padding(.horizontal)
                            
                            HStack {
                                Text(game.Developer)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Spacer()
                                
                            }
                            .padding(.horizontal)
                            
                            PlatformsView(geo: geo, game: game)
                            
                            if Int(game.DiscPerc)! > 0 {
                                DiscountView(game: game, geo: geo)
                            }
                            
                            
                            if game.PSPlusNeeded == "1" && game.OnlinePlay == "1" {
                                HStack {
                                    Image(systemName: "circle.grid.cross.fill")
                                    Text("Для игры в сети требуется PS Plus")
                                }
                                .padding()
                            }
                            
                            if game.OnlinePlay == "1" {
                                
                                HStack {
                                    Image(systemName: "network")
                                    Text("Возможна игра в сети")
                                }
                                .padding()
                                if game.OnlinePlay == "1" {
                                    HStack {
                                        Image(systemName: "network")
                                        Text("До \(game.OnlinePlayers) игроков в сети")
                                    }
                                    .padding()
                                }
                                
                                
                            }
                            
                            HStack {
                                Image(systemName: "person.3.fill")
                                Text("Игроки: \(game.OfflinePlayers)")
                            }
                            .padding()
                            
                            Text("Рейтинг: \(game.Rating)")
                                .padding()
                            
                            
                            
                            
                            
                            ScreenshotsView(geo: geo, screenshots: viewModel.screenshots)
                            
                            Text(game.Desc)
                                .padding()
                        }
                    }
                }
            }
        } else { ProgressView() }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(viewModel: DetailsViewModel(id: "7704", networkService: NetworkService()))
    }
}

struct DiscountView: View {
    let game: GameInfo
    let geo: GeometryProxy
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: geo.size.width - 32)
                .cornerRadius(15)
                .foregroundColor(Color(uiColor: UIColor(white: 0.9, alpha: 1)))
            
            VStack(spacing: 16) {
                HStack {
                    Text("Save \(game.DiscPerc) %")
                        .font(.system(size: 10))
                    Text("Предложение заканчивается \(game.DiscountedUntil)")
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                    Spacer()
                }
                
                HStack {
                    Image(systemName: "bag")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 32)
                    Text(game.formattedSalePrice)
                    Text(game.formattedBasePrice)
                        .strikethrough()
                        .foregroundColor(.gray)
                    Spacer()
                }
                
                HStack {
                    Link("Где купить?", destination:URL(string: game.PSStoreURL)!)
                        .padding(.vertical)
                        .frame(width: 300)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                    Spacer()
                }
            }
            .padding()
        }
        .padding(.horizontal)
    }
}

struct ImageView: View {
    let geo: GeometryProxy
    let game: GameInfo
    var body: some View {
        AsyncImage(url: URL(string: game.CoverArt)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
                .frame(width: geo.size.width - 32, height: 222)
        }
        .aspectRatio(contentMode: .fit)
        .frame(width: geo.size.width - 32)
        .cornerRadius(10)
    }
}

struct PlatformsView: View {
    let geo: GeometryProxy
    let game: GameInfo
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: geo.size.width - 32)
                .cornerRadius(15)
                .foregroundColor(Color(uiColor: UIColor(white: 0.9, alpha: 1)))
            
            VStack(spacing: 12) {
                HStack {
                    Text("Доступно на:")
                    
                    Text("PS5 |")
                    
                    
                    if game.IsPS4 == "1" {
                        Text("PS4")
                    }
                    Spacer()
                }
                HStack {
                    Text("Выпущено: \(game.ReleaseDate)")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    Spacer()
                }
                
            }
            .padding()
            
        }
        .padding(.horizontal)
    }
}

struct ScreenshotsView: View {
    let geo: GeometryProxy
    let screenshots: [Screenshot]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(screenshots, id: \.self) { screenshot in
                    AsyncImage(url: URL(string: screenshot.url)) { screenshot in
                        screenshot.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width - 32)
                }
            }
        }
        .padding()
    }
}

