//
//  SideMenuView.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 23.05.2023.
//

import SwiftUI

struct SideMenuView: View {
    
    @Binding var selectedView: SideMenuViewModel
    @Binding var isShowing: Bool
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea(.all)
                VStack(alignment: .leading) {
                    SideMenuHeaderView()
                    Text("New Releases")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    ForEach(SideMenuViewModel.allCases.prefix(5), id: \.self) { item in
                        RowView(image: item.imageForNewReleases , text: item.titleForNewReleases)
                            .padding(.horizontal)
                            .foregroundColor(.black)
                            .onTapGesture {
                                vm.allGames.removeAll()
                                vm.setDefaultQuerry(page: true, sorting: true)
                                selectedView = item
                                
                                withAnimation(.spring()) {
                                    isShowing.toggle()
                                }
                            }
                    }
                    
                    Text("Top")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    ForEach(SideMenuViewModel.allCases.suffix(3), id: \.self) { item in
                        RowView(image: item.imageForNewReleases , text: item.titleForNewReleases)
                            .padding(.horizontal)
                            .foregroundColor(.black)
                            .onTapGesture {
                                selectedView = item
                                withAnimation(.spring()) {
                                    isShowing.toggle()
                                }
                            }
                    }
                    Spacer()
                }
            }
            .frame(width: geometry.size.width * 2 / 3)
            .position(x: geometry.size.width * 1 / 3, y: geometry.size.height / 2)
        }
    }
}


struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(selectedView: .constant(.newAndTrending), isShowing: .constant(false))
    }
}
