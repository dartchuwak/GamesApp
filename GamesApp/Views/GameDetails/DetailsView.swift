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
    
    var body: some View {
        
        if let game = detailsViewModel.game {
            
            GeometryReader { geo in
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        ZStack {
                            AsyncImage(url: URL(string: game.background_image ?? "")) { phase in
                                       switch phase {
                                       case .empty:
                                           ProgressView()
                                               .frame(height: 400)
                                       case .success(let image):
                                           image
                                               .resizable()

                                               .onAppear {
                                                   print("----> in onappear ")
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
                            
                        }
                        
                        Text(game.name)
                            .padding(.horizontal)
                            .font(.title)
                            .fontWeight(.heavy)
                        
                        Text("About")
                            .font(.title)
                            .padding(.horizontal)
                        
                            Text(game.description_raw ?? "")
                                  .padding(.horizontal)
                                  .lineLimit(5)
                                  .overlay {
                                      LinearGradient(colors: [Color.clear, Color.white], startPoint: .top, endPoint: .bottom)
                                  }
                        NavigationLink {
                            ScrollView {
                                Text(detailsViewModel.getDescription(text: game.description))
                            }
                        } label: {
                            Text("Show more")
                                .accentColor(Color.purple)
                                .padding(.horizontal)
                                .fontWeight(.semibold)
                        }
                    }
                }
                .opacity(isLoaded ? 1 : 0)
            }
        } else {
            GeometryReader { geo in
                HStack (spacing: 12) {
                    CircleColors()
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
    
    static let vm = DetailsViewModel(id: 2454, networkService: NetworkService())
    static var previews: some View {
        DetailsView(detailsViewModel: vm)
            .onAppear{
                vm.fetchGame(with: 2454)
            }
    }
}

