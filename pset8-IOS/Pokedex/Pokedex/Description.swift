//
//  Description.swift
//  Pokedex
//
//  Created by Ali Riza Reisoglu on 8.10.2020.
//  Copyright © 2020 CS50. All rights reserved.
//

import Foundation
//create key value pairs to catch the description in desired language
struct PokemonDescription: Codable{
    let flavor_text_entries: [PokemonDescriptionText]
}

struct PokemonDescriptionText: Codable{
    let flavor_text: String
    let language: PokemonDescriptionLanguage
    let version: PokemonDescriptionVersion
}

struct PokemonDescriptionLanguage: Codable{
    let name: String
    let url: String
}

struct PokemonDescriptionVersion: Codable{
    let name: String
    let url: String
}


