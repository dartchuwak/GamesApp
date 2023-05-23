//
//  SideMenuView.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 23.05.2023.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(.all)
            
            VStack {
                SideMenuHeaderView()
                
                
                SideMenuCellView()
                SideMenuCellView()
                SideMenuCellView()
                SideMenuCellView()
                SideMenuCellView()
                Spacer()
                
            }
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
