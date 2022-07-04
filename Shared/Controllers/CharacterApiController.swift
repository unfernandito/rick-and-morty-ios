//
//  Characters.swift
//  rick-and-morty-app
//
//  Created by luis.betancourt on 27/06/2022.
//

import Foundation
import SwiftUI

let URL_CHARACTERS = "https://rickandmortyapi.com/api/character"


final class CharacterApiController : ObservableObject {
    @Published var characters = [Character]()
    @Published var character: Character? = nil
    
    func loadDataCharacters(completion:@escaping (ApiResponse<[Character]>) -> ()) {
        guard let url = URL(string: URL_CHARACTERS) else {
            print("Invalid URL!")
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            if error != nil {
                print(error!)
                return
            }
            
            let characters = try! JSONDecoder().decode(ApiResponse<[Character]>.self, from: data!)
            
            DispatchQueue.main.async {
                completion(characters)
            }
        }).resume()
    }
    
    func loadDataCharacter(id: String, completion:@escaping (ApiResponse<Character>) -> ()) {
        guard let url = URL(string: "\(URL_CHARACTERS)/\(id)") else {
            print("Invalid URL!")
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            if error != nil {
                print(error!)
                return
            }
            
            let character = try! JSONDecoder().decode(ApiResponse<Character>.self, from: data!)
            
            DispatchQueue.main.async {
                completion(character)
            }
        }).resume()
    }
    
    func getCharacterStatus(status: String) -> Color {
        switch status {
            case "unknown":
                return Color.black
            case "Alive":
                return Color.green
            case "Dead":
                return Color.red
            default:
                return Color.red
        }
    }
}
