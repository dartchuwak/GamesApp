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
    @State private var isLoaded: Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Group {
            if let game = detailsViewModel.game {
                GeometryReader { geo in
                    ScrollView(.vertical) {
                        VStack(alignment: .leading, spacing: 16) {
                            
                            AsyncImage(url: URL(string: game.background_image ?? "")) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(height: 400)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .onAppear {
                                            withAnimation (.easeOut(duration: 0.2)){
                                                isLoaded = true
                                            }
                                        }
                                case .failure(_):
                                    Image(systemName: "exclamationmark.icloud")
                                        .resizable()
                                        .scaledToFit()
                                @unknown default:
                                    Image(systemName: "exclamationmark.icloud")
                                }
                            }
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width)
                            
                            
                            
                            Text(game.name)
                                .padding(.horizontal)
                                .font(.title)
                                .fontWeight(.heavy)
                            
                            
                            HStack(spacing: 8) {
                                Button {
                                    print("Add to my games")
                                } label: {
                                    AddToMyGamesButton()
                                    
                                }
                                
                                Button {
                                    print("Add to my games")
                                } label: {
                                    WhereToBuyButton()
                                    
                                }
                            }
                            .padding(.horizontal)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("About")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .padding(.horizontal)
                                
                                Text(game.description_raw ?? "")
                                    .padding(.horizontal)
                                    .lineLimit(5)
                                    .overlay {
                                        LinearGradient(colors: [Color.clear, colorScheme == .light ? Color.white: Color.black], startPoint: .top, endPoint: .bottom)
                                    }
                                NavigationLink {
                                    ScrollView {
                                        Text(game.description)
                                    }
                                } label: {
                                    Text("Show more")
                                        .accentColor(Color.purple)
                                        .padding(.horizontal)
                                        .fontWeight(.semibold)
                                }
                            }
                            
                            
                            Divider()
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Platforms")
                                    .foregroundColor(.gray)
                                    .padding(.horizontal)
                                
                                VStack(alignment: .leading) {
                                    ForEach(game.platforms, id:\.self) { plarform in
                                        Text(plarform.platform?.name ?? "Name")
                                        
                                    }
                                }
                                .padding(.horizontal)
                            }
                            Divider()
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Website")
                                    .foregroundColor(.gray)
                                    .padding(.horizontal)
                                Text(game.website ?? "")
                                    .padding(.horizontal)
                            }
                            
                            Divider()
                            if let platform = game.platforms.first(where: { $0.platform?.id == 4}) {
                                VStack(alignment: .leading, spacing: 4) {
                                    
                                    Text("System requiretmens for PC")
                                        .fontWeight(.bold)
                                    Text(platform.requirements?.minimum ?? "")
                                        .padding(.top, 4)
                                    
                                    Text(platform.requirements?.recommended ?? "")
                                        .padding(.top, 4)
                                    
                                    
                                }
                                .padding(.horizontal)
                            }
                            
                            
                            
                            
                        }
                    }
                    .opacity(isLoaded ? 1 : 0)
                }
            } else {
                GeometryReader { geo in
                    CircleColors()
                        .onAppear {
                            detailsViewModel.fetchGame(with: detailsViewModel.id)
                        }
                        .frame(width: geo.size.width, height: geo.size.height)
                        .position(x: geo.size.width * 0.5, y: geo.size.height * 0.5)
                }
                
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    
    static let vm = DetailsViewModel(id: 2454, networkService: NetworkService())
    static var previews: some View {
        DetailsView(detailsViewModel: vm)
            .onAppear{
                vm.fetchGame(with: 2454)
            }
    }
}

