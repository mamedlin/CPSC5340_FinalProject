//
//  CharactersView.swift
//  GOTWiki
//
//  Created by Michael Medlin on 4/24/24.
//

import SwiftUI

struct CharactersView: View {
    @StateObject var charactersvm = CharactersViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach($charactersvm.characters) { $character in
                    NavigationLink {
                        CharacterView(character: $character)
                    } label: {
                        HStack {
                            Text(getCharacterNumber(from: character.url))
                                .bold()
                            
                            Spacer()
                            
                            if let name = character.name, !name.isEmpty {
                                Text(name)
                                    .bold()
                            } else if let alias = character.aliases?.first, !alias.isEmpty {
                                Text(alias)
                                    .bold()
                            } else {
                                Text("Unknown")
                                    .bold()
                            }
                        }
                    }
                }
            }
            .task {
                await charactersvm.fetchData()
            }
            .listStyle(.grouped)
            .navigationTitle("GOT Character List")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func getCharacterNumber(from url: String) -> String {
        if let url = URL(string: url) {
            return url.lastPathComponent
        }
        return ""
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}
