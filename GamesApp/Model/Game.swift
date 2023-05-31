import Foundation


struct GamesResponse: Decodable, Hashable {
    let next: String
    let results: [Game]
}


struct Game: Decodable, Hashable, Identifiable {
    let id: Int
    let name: String
    let released: String?
    let metacritic: Int?
    let background_image: String?
    let rating: Double
    let rating_top: Int
    let suggestions_count: Int
    let platforms: [Platform]?
}

struct Platform: Decodable, Hashable {
    let platform: PlatformItem?
    let released_at: String?
    let requirements: Requirement?
}

struct PlatformItem: Decodable, Hashable {
    let id: Int
    let slug: String
    let name: String
}

struct Requirement: Decodable, Hashable {
    let minimum: String?
    let recommended: String?
}

struct GameDetails: Decodable, Hashable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let metacritic: Int?
    let released: String?
    let background_image: String?
    let backgroundImageAdditional: String?
    let website: String?
    let rating: Double
    let rating_top: Int
    let saturatedColor, dominantColor: String?
    let description_raw: String?
    let platforms: [Platform]
}

let mockGameDetails = GameDetails(id: 3498,
                                  name: "GTA",
                                  description: "Desc",
                                  metacritic: 92,
                                  released: "1990",
                                  background_image: "https://media.rawg.io/media/games/c4b/c4b0cab189e73432de3a250d8cf1c84e.jpg",
                                  backgroundImageAdditional: "https://media.rawg.io/media/games/c4b/c4b0cab189e73432de3a250d8cf1c84e.jpg",
                                  website: "https://bethesda.net/game/doom",
                                  rating: 4.92,
                                  rating_top: 5,
                                  saturatedColor: "",
                                  dominantColor: "",
                                  description_raw: "",
                                  platforms: [Platform(platform: PlatformItem(id: 1, slug: "PC", name: "PlayStation 5"), released_at: "2020", requirements: Requirement(minimum: "min", recommended: "rec"))])


let mockGame = Game(id: 3498,
                    name: "Doom",
                    released: "2017",
                    metacritic: 92,
                    background_image: "https://media.rawg.io/media/games/c4b/c4b0cab189e73432de3a250d8cf1c84e.jpg",
                    rating: 4.92,
                    rating_top: 5,
                    suggestions_count: 200,
                    platforms: [Platform(platform: PlatformItem(id: 1, slug: "PC", name: "PlayStation 5"), released_at: "2020", requirements: Requirement(minimum: "min", recommended: "rec"))])

