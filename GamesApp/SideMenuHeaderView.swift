//
//  SideMenuHeaderView.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 23.05.2023.
//

import SwiftUI

struct SideMenuHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("rawg_icon")
                .resizable()
                .frame(width: 64,height: 64)
                .foregroundColor(.yellow)
                .clipped()
                .clipShape(Circle())
                .padding(.bottom, 16)
            HStack {
                Spacer()
            }
        }
        .padding()
    }
}

struct SideMenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeaderView()
    }
}
