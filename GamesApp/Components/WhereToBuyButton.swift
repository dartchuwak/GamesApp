//
//  WhereToBuyButton.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 25.05.2023.
//

import SwiftUI



struct WhereToBuyButton: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text("Buy")
                        .foregroundColor(colorScheme == .dark ? Color.black: Color.white)
                }
                Image(systemName: "cart.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color.green)
            }
            .padding(8)
            .background(Color.black)
            .cornerRadius(10)
        }
}

struct WhereToBuyButton_Previews: PreviewProvider {
    static var previews: some View {
        WhereToBuyButton()
    }
}

