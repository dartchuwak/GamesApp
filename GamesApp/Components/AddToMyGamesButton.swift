//
//  AddToMyGamesButton.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 25.05.2023.
//

import SwiftUI

struct AddToMyGamesButton: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Add to")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                    Text("My games")
                        .foregroundColor(colorScheme == .dark ? Color.black: Color.white)
                }
                Image(systemName: "plus.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color.green)
            }
            .padding(8)
        }
        .background(Color.black)
        .cornerRadius(10)
    }
}

struct AddToMyGamesButton_Previews: PreviewProvider {
    static var previews: some View {
        AddToMyGamesButton()
    }
}
