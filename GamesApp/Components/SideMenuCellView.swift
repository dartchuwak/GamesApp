//
//  SideMenuCellView.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 23.05.2023.
//

import SwiftUI

struct SideMenuCellView: View {
    var body: some View {
        HStack {
            Image(systemName: "person")
                .frame(width: 24, height: 24)
                .fontWeight(.semibold)
            Text("Menu")
                .font(.system(size: 15, weight: .semibold))
            
            Spacer()
        }
        .padding()
    }
}

struct SideMenuCellView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuCellView()
    }
}
