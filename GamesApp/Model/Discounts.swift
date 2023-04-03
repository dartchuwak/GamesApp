//
//  Discounts.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 04.04.2023.
//

import Foundation

struct DiscountsResponse: Decodable {
    let sales: [Discounts]
}

struct Discounts: Decodable, Identifiable, Hashable {
    let id: UUID
    let ID: String
    let SaleTime: String
    let SaleEnd: String
    let NumGames: String
    let ImgURL: String
    let SalesName: String
}



