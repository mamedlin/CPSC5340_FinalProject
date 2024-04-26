//
//  CharacterModel.swift
//  GOTWiki
//
//  Created by Michael Medlin on 4/23/24.
//

import Foundation

struct CharacterResults : Codable {
    let results : [CharacterModel]
}


struct CharacterModel: Codable {
    let url: String
    let name: String?
    let gender: String?
    let culture: String?
    let born: String?
    let died: String?
    let titles: [String]?
    let aliases: [String]?
    let father: String?
    let mother: String?
    let spouse: String?
    let allegiances: [String]?
    let books: [String]?
    let povBooks: [String]?
    let tvSeries: [String]?
    let playedBy: [String]?
}

extension CharacterModel: Identifiable {
    var id: String { url }
}

