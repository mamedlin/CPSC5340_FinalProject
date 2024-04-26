//
//  SavedCharacterViewModel.swift
//  GOTWiki
//
//  Created by Michael Medlin on 4/24/24.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class SavedCharacterViewModel : ObservableObject {
    
    @Published var savedCharacter = [SavedCharacterModel]()
    let db = Firestore.firestore()
    
    func fetchData() {
        self.savedCharacter.removeAll()
        db.collection("characters")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        do {
                            self.savedCharacter.append(try document.data(as: SavedCharacterModel.self))
                        } catch {
                            print(error)
                        }
                    }
                }
            }
    }
    
    func deleteCharacterDocument(characterID: String) async {
            do {
                try await db.collection("characters").document(characterID).delete()
                print("Document successfully removed!")
            } catch {
                print("Error removing document: \(error)")
            }
        }
    
}
