//
//  SavedCharacterModel.swift
//  GOTWiki
//
//  Created by Michael Medlin on 4/24/24.
//

import Foundation
import FirebaseFirestoreSwift

struct SavedCharacterModel: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String?
    var gender: String?
    var culture: String?
    var born: String?
    var died: String?
    var titles: [String]?
    var aliases: [String]?
    var father: String?
    var mother: String?
    var spouse: String?
    var allegiances: [String]?
    var books: [String]?
    var povBooks: [String]?
    var tvSeries: [String]?
    var playedBy: [String]?
}
