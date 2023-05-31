//
//  ReleaseCalendarView.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 23.05.2023.
//

import SwiftUI

struct ReleaseCalendarView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Text("Hello, ReleaseCalendarView!")
            .background(colorScheme == .dark ? Color.black : Color.white)
    }
}

struct ReleaseCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        ReleaseCalendarView()
            .environmentObject(ViewModel(networkService: NetworkService()))
    }
}
