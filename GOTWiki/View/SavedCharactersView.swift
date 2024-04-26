//
//  SavedCharactersView.swift
//  GOTWiki
//
//  Created by Michael Medlin on 4/24/24.
//

import SwiftUI

struct SavedCharactersView: View {
    
    @StateObject var savedCharacters = SavedCharacterViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(savedCharacters.savedCharacter) { savedChar in
                    NavigationLink {
                        SavedCharacterView(character: savedChar)
                    } label: {
                            
                        if let name = savedChar.name, !name.isEmpty {
                            Text(name)
                                .bold()
                        } else if let alias = savedChar.aliases?.first, !alias.isEmpty {
                            Text(alias)
                                .bold()
                        } else {
                            Text("Unknown")
                                .bold()
                        }

                    }
                }
            }
            
            .onAppear {
                savedCharacters.fetchData()
            }
            .listStyle(.grouped)
            .navigationTitle("Saved GOT Character List")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct SavedCharactersView_Previews: PreviewProvider {
    static var previews: some View {
        SavedCharactersView()
    }
}
