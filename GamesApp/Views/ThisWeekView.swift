//
//  ThisWeekView.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 23.05.2023.
//

import SwiftUI

struct ThisWeekView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Text("Hello, ThisWeekView!")
            .background(colorScheme == .dark ? Color.black : Color.white)
    }
}

struct ThisWeekView_Previews: PreviewProvider {
    static var previews: some View {
        ThisWeekView()
            .environmentObject(ViewModel(networkService: NetworkService()))
    }
}
