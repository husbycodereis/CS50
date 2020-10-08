import Foundation

struct PokemonListResults: Codable {
    let results: [PokemonListResult]
}

struct PokemonListResult: Codable {
    let name: String
    let url: String
    
}

struct PokemonResult: Codable {
    let id: Int
    let name: String
    let types: [PokemonTypeEntry]
}

struct PokemonTypeEntry: Codable {
    let slot: Int
    let type: PokemonType
}

struct PokemonType: Codable {
    let name: String
}
//create a Class variable to check if the pokemon is catched or not
struct PokemonCatch {
    var isCatched = [String: Bool]()
        }

//create a Class to add image
struct PokemonImage: Codable {
    let sprites: PokemonImageData
        }

struct PokemonImageData: Codable {
    let front_default: String
        }
