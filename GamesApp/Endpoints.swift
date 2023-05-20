////
////  Endpoints.swift
////  GamesApp
////
////  Created by Evgenii Mikhailov on 06.05.2023.
////
//
//import Foundation
//
//
//protocol Endpoint {
//   // var httpMethod: HTTPMethod { get }
//    var baseURLString: String { get }
//    var path: String { get }
//    var headers: [String: Any]? { get }
//    var body: [String: Any]? { get }
//}
//
//extension Endpoint {
//    // a default extension that creates the full URL
//    var url: String {
//        return baseURLString + path
//    }
//}
//
//
//enum Endpoints: Endpoint {
//    
//    case getAllGames
//    
//    var httpMethod: String {
//         switch self {
//         case .getAllGames:
//             return "GET"
//         }
//     }
//     
//     var baseURLString: String {
//         switch self {
//         case .getAllGames:
//             return "https://pabloblan.co/api/"
//         }
//     }
//     
//     var path: String {
//         switch self {
//         case .getAllGames(let city):
//             return "v1/users/\(city)/"
//         }
//     }
//     
//     var headers: [String: Any]? {
//         switch self {
//         case .getAllGames:
//             return ["Content-Type": "application/json",
//                     "Accept": "application/json",
//                     "Authorization": "1a2s3d4f5g6h7j",
//                     "API-KEY": "123456789",
//                     "PROJECT": "PROJECT1",
//                     "CHANNEL": "IOS"]
//         }
//     }
//     
//     var body: [String : Any]? {
//         switch self {
//         case .getAllGames:
//             return [:]
//         }
//     }
//}
