//
//  EpisodeApiController.swift
//  rick-and-morty-appTests
//
//  Created by luis.betancourt on 04/07/2022.
//

import Foundation

let URL_EPISODES = "https://rickandmortyapi.com/api/episode"

final class EpisodeApiController : ObservableObject {
    @Published var episodes: [Episode] = [Episode]()
    @Published var episode: Optional<Episode> = nil
    
    func loadDataEpisodes(completion:@escaping (ApiResponse<[Episode]>) -> ()){
        guard let url = URL(string: URL_EPISODES) else {
            print("Invalid URL!")
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: {data, response, error in
            if error != nil {
                print(error!)
                return
            }
            
            let locations = try! JSONDecoder().decode(ApiResponse<[Episode]>.self, from: data!)
            
            DispatchQueue.main.async {
               completion(locations)
            }
        }).resume()
    }
    
    func loadDataEpisode(episodeID: Int, completion:@escaping (ApiResponse<Episode>) -> ()){
        guard let url = URL(string: "\(URL_EPISODES)/\(String(episodeID))") else {
            print("Invalid URL!")
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: {data, response, error in
            if error != nil {
                print(error!)
                return
            }
            
            let location = try! JSONDecoder().decode(ApiResponse<Episode>.self, from: data!)
            
            DispatchQueue.main.async {
               completion(location)
            }
        }).resume()
    }
}
