//
//  HomeView.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 23.05.2023.
//

import SwiftUI

struct HomeView: View  {
    
    @State private var selectedView: SideMenuViewModel = .newAndTrending
    @State private var isShowing = false
    
    var body: some View {
        NavigationView {
            ZStack {
                switch selectedView {
                case .newAndTrending:
                    NewAndTrandingView()
                case .last30Days:
                    Last30DaysView()
                case .nextWeek:
                    NextWeekView()
                case .releaseCalendar:
                    ReleaseCalendarView()
                case .thisWeek:
                    ThisWeekView()
                }
                
                SideMenuView(selectedView: $selectedView, isShowing: $isShowing)
                    .offset(x: isShowing ? 0:-UIScreen.main.bounds.width, y: 0)
                
                EmptyView()
                    .navigationBarItems(leading: Button(action: {
                        withAnimation(.easeInOut(duration:0.8)) {
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
