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
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 64,height: 64)
                .foregroundColor(.yellow)
                .padding(.bottom, 16)
            
            
            Text("RAWG.IO")
                .font(.system(size: 24, weight: .semibold))
            Text("58M games")
                .font(.system(size: 16))
            
            HStack {
                Text("Tone of games")
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
