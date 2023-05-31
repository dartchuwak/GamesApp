//
//  SideMenuCellView.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 23.05.2023.
//

import SwiftUI

struct SideMenuCellView: View {
    var body: some View {
        VStack {
            HStack {
                Text("New Releases")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            RowView(image: "star.fill", text: "Last 30 Days")
            RowView(image: "flame", text: "This Week")
            RowView(image: "arrowshape.right.fill", text: "Next Week")
            RowView(image: "31.circle", text: "Release Calendar")
            
        }
        .padding()
    }
}

struct SideMenuCellView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuCellView()
    }
}

struct RowView: View {
    
    var image : String
    var text: String
    var body: some View {
        HStack {
            Image(systemName: image)
                .frame(width: 24, height: 24)
                .fontWeight(.semibold)
            Text(text)
                .font(.system(size: 15, weight: .semibold))
            
            Spacer()
        }
    }
}
