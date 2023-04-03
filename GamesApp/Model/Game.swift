//
//  Character.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 13.03.2023.
//

import Foundation
import SwiftUI


// MARK: - DiscountsResponse
struct DiscountsResponse: Hashable,  Decodable {
    let SaleName: String?
    let SaleTime: String?
    let SaleEnd: String?
    let ImgURL: String
    let Region: String
    let game_discounts: [Game]
    //  let dlcDiscounts: [DLC]
    let error: Int
    let errorDesc: String
    let apiLimit: String
    let apiUsage: String
}

// MARK: - DlcDiscount
struct DLC: Hashable,  Decodable {
    let PPID: String
    let Name: String
    let Img: String
    let BasePrice: String
    let SalePrice: String
    let PlusPrice: String
    let ParentGame: String
    let FormattedBasePrice: String
    let FormattedSalePrice: String
    let FormattedPlusPrice: String
    let PlatPricesURL: String
}

// MARK: - GameDiscount
struct Game: Hashable, Decodable, Identifiable {
    var id: Int?
    let PPID: String
    let Name: String
    let Img: String
    let OpenCriticID: String
    let Difficulty: String
    let IsPS4: String
    let IsPS5: String
    let LastDiscounted: String
    let DiscountedUntil: String
    let BasePrice: String
    let SalePrice: String
    let PlusPrice: String
    let formattedBasePrice: String
    let formattedSalePrice: String
    let formattedPlusPrice: String
    let PlatPricesURL: String
}

struct GameInfo: Decodable {
    let GameName: String
    let GameID: String
    let Desc: String
    let Img: String
    let CoverArt: String
    let LogoImg: String
    let Screenshot1: String
    let Screenshot2: String
    let Screenshot3: String
    let Screenshot4: String
    let Screenshot5: String
    let Screenshot6: String
    let Screenshot7: String
    let Screenshot8: String
    let Screenshot9: String
    let PreviewVideo: String
    let Publisher: String
    let Developer: String
    let IsPS4: String
    let IsPS5: String
    let IsVR: String
    let BasePrice: String
    let PlusPrice: String
    let SalePrice: String
    let LowestEverPrice: String
    let LowestEverPlusPrice: String
    let DiscPerc: String
    let ReleaseDate: String
    let LastDiscounted: String
    let DiscountedUntil: String
    let PSPExPremUntil: String
    let PSPExtra: String
    let PSPPremium: String
    let PSNID: String
    let ProductName: String
    let PPID: String
    let Rating: String
    let formattedBasePrice: String
    let formattedSalePrice: String
    let formattedPlusPrice: String
    let PSStoreURL: String
    let PlatPricesURL: String
    let error: Int
    let errorDesc: String
    let apiLimit: String
    let apiUsage: String
    
}

struct Screenshot: Identifiable, Hashable {
    let id: UUID
    let url: String
}







