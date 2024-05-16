//
//  Model.swift
//  DisneyCharacterGuesser
//
//  Created by Thomas Ogawa on 5/15/24.
//

import Foundation

struct DisneyCharacter: Codable{
    let name: String
    let films: [String]
    let imgUrl: String
}
