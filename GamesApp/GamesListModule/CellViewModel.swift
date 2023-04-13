//
//  CellViewModel.swift
//  GamePrice
//
//  Created by Evgenii Mikhailov on 14.03.2023.
//

import Foundation
import IGDB_SWIFT_API
import UIKit
import SwiftUI


class CellViewModel: ObservableObject {
    
    var game: Proto_Game
    var imageURL: String?
    var coverData: UIImage?
    
    init (game: Proto_Game) {
        self.game = game
        let image_id = game.cover.imageID
        imageURL = imageBuilder(imageID: image_id, size: .COVER_BIG, imageType: .PNG)
        load()
    }
    
    
    
    func load() {
        
        URLSession.shared.dataTask(with: URL(string: imageURL!)!) { [weak self] data, response, error in
            self?.coverData = UIImage(data: data!)!
        }
    }
    
}
