//
//  CharactersViewModel.swift
//  GOTWiki
//
//  Created by Michael Medlin on 4/23/24.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class CharactersViewModel: ObservableObject {
    @Published var characters: [CharacterModel] = []
    private let url = "https://anapioficeandfire.com/api/characters"
    
    let db = Firestore.firestore()
    
    func fetchData() {
        var allCharacters: [CharacterModel] = []
        let group = DispatchGroup()
        
        func fetchPage(page: Int) {
            if let url = URL(string: "\(self.url)?page=\(page)&pageSize=50") {
                group.enter()
                
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    defer { group.leave() }
                    
                    if let error = error {
                        print("Error fetching data: \(error)")
                    } else {
                        if let data = data {
                            do {
                                let characters = try JSONDecoder().decode([CharacterModel].self, from: data)
                                allCharacters.append(contentsOf: characters)
                            } catch {
                                print("Error decoding data: \(error)")
                            }
                        }
                    }
                }.resume()
            }
        }
        

        for page in 1...42 { 
            fetchPage(page: page)
        }
        
        group.notify(queue: .main) {
            self.characters = allCharacters
            print("Fetched \(self.characters.count) characters")
        }
    }
    func saveData(character: CharacterModel) async {
        
        let name = character.name ?? ""
        let gender = character.gender ?? ""
        let culture = character.culture ?? ""
        let born = character.born ?? ""
        let died = character.died ?? ""
        let father = character.father ?? ""
        let mother = character.mother ?? ""
        let spouse = character.spouse ?? ""
        
        
        let aliases = character.aliases ?? []
        let allegiances = character.allegiances ?? []
        let books = character.books ?? []
        let titles = character.titles ?? []
        let tvSeries = character.tvSeries ?? []
        let povBooks = character.povBooks ?? []
        let playedBy = character.playedBy ?? []

        do {
            let ref = try await db.collection("characters").addDocument(data: [
                "aliases": aliases.isEmpty ? [] : FieldValue.arrayUnion(aliases),
                "allegiances": allegiances.isEmpty ? [] : FieldValue.arrayUnion(allegiances),
                "books": books.isEmpty ? [] : FieldValue.arrayUnion(books),
                "born": born,
                "culture": culture,
                "died": died,
                "father": father,
                "mother": mother,
                "gender": gender,
                "name": name,
                "playedBy": playedBy.isEmpty ? [] : FieldValue.arrayUnion(playedBy),
                "spouse": spouse,
                "titles": titles.isEmpty ? [] : FieldValue.arrayUnion(titles),
                "tvSeries": tvSeries.isEmpty ? [] : FieldValue.arrayUnion(tvSeries),
                "povBooks": povBooks.isEmpty ? [] : FieldValue.arrayUnion(povBooks),
                "url": character.url
            ])
            print("Document added with ID: \(ref.documentID)")
        } catch {
            print("Error adding document: \(error)")
        }
    }
}

