//
//  HomeView.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 23.05.2023.
//

import SwiftUI

struct HomeView: View  {
    
    @State private var isShowing = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if isShowing {
                    SideMenuView()
                }
                GamesView()
                    .offset(x: isShowing ? 250:0, y: 0)
                    .navigationBarItems(leading: Button(action: {
                        withAnimation(.spring()) {
                            isShowing.toggle()
                        }
                        
                    }, label: {
                        Image(systemName: "list.bullet")
                            .foregroundColor(.black)
                    }))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static let vm = ViewModel(networkService: NetworkService())
    static var previews: some View {
        HomeView()
            .environmentObject(vm)
    }
}
