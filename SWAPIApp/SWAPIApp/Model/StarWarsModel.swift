//
//  StarWarsCharacters.swift
//  SWAPIApp
//
//  Created by aspire on 9/15/20.
//  Copyright © 2020 aspire. All rights reserved.
//

import Foundation

// Model for StarWars characters
struct StarWarsModel: Decodable {
    let count: Int
    let characters: [SWCharacter]
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case characters = "results"
    }
}

// Contains data of each StarWar character
struct SWCharacter: Decodable {
    let name: String
    let height: String
    let mass: String
    let hair_color: String
    let skin_color: String
    let eye_color: String
    let birth_year: String
    let gender: String
    let films: [String]
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case height = "height"
        case mass = "mass"
        case hair_color = "hair_color"
        case skin_color = "skin_color"
        case eye_color = "eye_color"
        case birth_year = "birth_year"
        case gender = "gender"
        case films = "films"
    }
}
