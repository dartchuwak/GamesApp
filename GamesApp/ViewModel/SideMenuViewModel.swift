//
//  SideMenuViewModel.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 23.05.2023.
//

import Foundation
import SwiftUI


enum SideMenuViewModel: Int, CaseIterable {
    case newAndTrending
    case last30Days
    case thisWeek
    case nextWeek
    case releaseCalendar
    case bestOfTheYear
    case popularInLastYear
    case allTime250
    
    var titleForNewReleases: String {
        switch self {
        case .last30Days: return "Last 30 days"
        case .nextWeek: return "Next Week"
        case .thisWeek: return "This Week"
        case .releaseCalendar: return "Release Calendar"
        case .newAndTrending: return "New And Tranding"
        case .bestOfTheYear: return "Best of The Year"
        case .popularInLastYear: return "Popular in 2022"
        case .allTime250: return "All Time 250"
        }
    }
    
    var imageForNewReleases: String {
        switch self {
        case .last30Days: return "star.fill"
        case .nextWeek: return "flame"
        case .thisWeek: return "arrowshape.right.fill"
        case .releaseCalendar: return "31.circle"
        case .newAndTrending: return "house.fill"
        case .bestOfTheYear: return "star.fill"
        case .popularInLastYear: return "chart.bar.xaxis"
        case .allTime250: return "crown.fill"
        }
    }
}


