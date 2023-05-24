//
//  SideMenuViewModel.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 23.05.2023.
//

import Foundation
import SwiftUI


enum SideMenuViewModel: Int, CaseIterable {
    case last30Days
    case thisWeek
    case nextWeek
    case releaseCalendar
    case newAndTrending
    
    var titile: String {
        switch self {
        case .last30Days: return "Last 30 days"
        case .nextWeek: return "Next week"
        case .thisWeek: return "This Week"
        case .releaseCalendar: return "Release Calendar"
        case .newAndTrending: return "newAndTrending"
        }
    }
    
    var image: String {
        switch self {
        case .last30Days: return "star.fill"
        case .nextWeek: return "flame"
        case .thisWeek: return "arrowshape.right.fill"
        case .releaseCalendar: return "31.circle"
        case .newAndTrending: return "31.circle"
        }
    }
    
    var destinationView: some View {
          switch self {
          case .last30Days:
              return AnyView(Last30DaysView())
          case .nextWeek:
              return AnyView(NextWeekView())
          case .thisWeek:
              return AnyView(ThisWeekView())
          case .releaseCalendar:
              return AnyView(ReleaseCalendarView())
              
          case .newAndTrending:
              return AnyView(NewAndTrandingView())
          }
      }
}

class SideMenuController: ObservableObject {
    @Published var isShowing = false
}

