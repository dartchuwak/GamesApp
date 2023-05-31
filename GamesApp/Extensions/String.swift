//
//  String.swift
//  GamesApp
//
//  Created by Evgenii Mikhailov on 25.05.2023.
//

import Foundation

extension String {
    func htmlAttributedString() -> String? {
        guard let data = self.data(using: .utf8) else { return nil }
        guard let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil) else { return nil }
        return attributedString.string
    }
}

