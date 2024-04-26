//
//  CharacterView.swift
//  GOTWiki
//
//  Created by Michael Medlin on 4/24/24.
//

import SwiftUI

struct CharacterView: View {
    @Binding var character: CharacterModel
    @StateObject var charactervm = CharactersViewModel()
       
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
                }
                .padding()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            Task {
                                do {
                                    try await charactervm.saveData(character: character)
                                } catch {
                                    print("Error saving data: \(error)")
                                }
                            }
                        } label: {
                            Text("Save")
                        }
                    }
                }
            }
       }
   }

