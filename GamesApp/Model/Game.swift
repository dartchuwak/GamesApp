import Foundation


struct GamesResponse: Decodable, Hashable {
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
}

let mockGameDetails = GameDetails(id: 3498,
                                  name: "GTA",
                                  description: "Desc",
                                  metacritic: 92,
                                  released: "1990",
                                  background_image: "https://media.rawg.io/media/games/c4b/c4b0cab189e73432de3a250d8cf1c84e.jpg",
                                  backgroundImageAdditional: "https://media.rawg.io/media/games/c4b/c4b0cab189e73432de3a250d8cf1c84e.jpg",
                                  website: "https://media.rawg.io/media/games/c4b/c4b0cab189e73432de3a250d8cf1c84e.jpg",
                                  rating: 4.92,
                                  rating_top: 5,
                                  saturatedColor: "",
                                  dominantColor: "",
                                  description_raw: "")


let mockGame = Game(id: 3498,
                    name: "Doom",
                    released: "2017",
                    metacritic: 92,
                    background_image: "https://media.rawg.io/media/games/c4b/c4b0cab189e73432de3a250d8cf1c84e.jpg",
                    rating: 4.92,
                    rating_top: 5,
                    suggestions_count: 200)

