//
//  SavedCharacterView.swift
//  GOTWiki
//
//  Created by Michael Medlin on 4/24/24.
//

import SwiftUI

struct SavedCharacterView: View {
    var character: SavedCharacterModel
    @StateObject var savedCharactersViewModel = SavedCharacterViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                if let name = character.name, !name.isEmpty {
                    Text(name)
                        .bold()
                        .font(.largeTitle)
                } else if let alias = character.aliases?.first, !alias.isEmpty {
                    Text(alias)
                        .bold()
                        .font(.largeTitle)
                } else {
                    Text("Unknown")
                        .bold()
                        .font(.largeTitle)
                }
                
                Spacer()
                
                if let gender = character.gender, !gender.isEmpty {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Gender:")
                            .font(.title2)
                            .bold()
                        
                        Text(gender)
                            .font(.headline)
                    }
                }
                
                if let culture = character.culture, !culture.isEmpty {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Culture:")
                            .font(.title2)
                            .bold()
                        
                        Text(culture)
                            .font(.headline)
                    }
                }
                
                if let born = character.born, !born.isEmpty {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Born:")
                            .font(.title2)
                            .bold()
                        
                        Text(born)
                            .font(.headline)
                    }
                }
                
                if let died = character.died, !died.isEmpty {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Died:")
                            .font(.title2)
                            .bold()
                        
                        Text(died)
                            .font(.headline)
                    }
                }
                
                if let titles = character.titles, !titles.isEmpty {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Titles:")
                            .font(.title2)
                            .bold()
                        
                        Text(titles.joined(separator: ", "))
                            .font(.headline)
                    }
                }
                
                if let aliases = character.aliases, !aliases.isEmpty {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Aliases:")
                            .font(.title2)
                            .bold()
                        
                        Text(aliases.joined(separator: ", "))
                            .font(.headline)
                    }
                }
                
                if let father = character.father, !father.isEmpty {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Father:")
                            .font(.title2)
                            .bold()
                        
                        Text(father)
                            .font(.headline)
                    }
                }
                
                if let mother = character.mother, !mother.isEmpty {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Mother:")
                            .font(.title2)
                            .bold()
                        
                        Text(mother)
                            .font(.headline)
                    }
                }
                
                if let spouse = character.spouse, !spouse.isEmpty {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Spouse:")
                            .font(.title2)
                            .bold()
                        
                        Text(spouse)
                            .font(.headline)
                    }
                }
                
                if let allegiances = character.allegiances, !allegiances.isEmpty {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Allegiances:")
                            .font(.title2)
                            .bold()
                        
                        Text(allegiances.joined(separator: ", "))
                            .font(.headline)
                    }
                }
                
                if let books = character.books, !books.isEmpty {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Books:")
                            .font(.title2)
                            .bold()
                        
                        Text(books.joined(separator: ", "))
                            .font(.headline)
                    }
                }
                
                if let povBooks = character.povBooks, !povBooks.isEmpty {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("POV Books:")
                            .font(.title2)
                            .bold()
                        
                        Text(povBooks.joined(separator: ", "))
                            .font(.headline)
                    }
                }
                
                if let tvSeries = character.tvSeries, !tvSeries.isEmpty {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("TV Series:")
                            .font(.title2)
                            .bold()
                        
                        Text(tvSeries.joined(separator: ", "))
                            .font(.headline)
                    }
                }
                
                if let playedBy = character.playedBy, !playedBy.isEmpty {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Played By:")
                            .font(.title2)
                            .bold()
                        
                        Text(playedBy.joined(separator: ", "))
                            .font(.headline)
                    }
                }
                
                Spacer()
                .padding()
            }
            .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                if let characterID = character.id {
                                    Task {
                                        await savedCharactersViewModel.deleteCharacterDocument(characterID: characterID)
                                        presentationMode.wrappedValue.dismiss() // Dismiss the view after deletion
                                    }
                                }
                            }) {
                                Text("Delete")
                                    .foregroundColor(.red)
                            }
                        }
                    }
        }
    }
    
    struct SavedCharacterView_Previews: PreviewProvider {
        static var previews: some View {
            let character = SavedCharacterModel(
                name: "Daenerys Targaryen",
                gender: "Female",
                culture: "Valyrian",
                born: "282 AC",
                died: "",
                titles: ["Queen of Meereen", "Khaleesi of the Great Grass Sea", "Breaker of Chains"],
                aliases: ["Dany", "Stormborn"],
                father: "Aerys II Targaryen",
                mother: "Rhaella Targaryen",
                spouse: "Khal Drogo",
                allegiances: ["House Targaryen", "House Stark"],
                books: ["https://anapioficeandfire.com/api/books/1"],
                povBooks: ["https://anapioficeandfire.com/api/books/1"],
                tvSeries: ["Game of Thrones"],
                playedBy: ["Emilia Clarke"]
            )
            
            SavedCharacterView(character: character)
        }
    }
}
