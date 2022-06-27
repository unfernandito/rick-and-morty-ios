//
//  Characters.swift
//  rick-and-morty-app
//
//  Created by luis.betancourt on 27/06/2022.
//

import Foundation

let URL_CHARACTERS = "https://rickandmortyapi.com/api/character"

struct Character: Codable, Identifiable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    // var origin: Object
    // var location: Location
    var image: String
    var episode: [String]
    var url: String
    var created: String
}

struct Info: Codable {
    var count: Optional<Int>
    var pages: Optional<Int>
    var next: Optional<String>
    var prev: Optional<String>
    var results: [Character]
}

class ApiRickAndMorty : ObservableObject {
    @Published var characters = [Character]()
    
    func loadDataCharacters(completion:@escaping (Info) -> ()) {
        guard let url = URL(string: URL_CHARACTERS) else {
            print("Invalid URL!")
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            let characters = try! JSONDecoder().decode(Info.self, from: data!)
            print(characters)
            
            DispatchQueue.main.async {
                completion(characters)
            }
        }).resume()
    }
}
