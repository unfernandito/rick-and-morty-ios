//
//  LocationApiController.swift
//  rick-and-morty-app (iOS)
//
//  Created by luis.betancourt on 29/06/2022.
//

import Foundation

let URL_LOCATIONS = "https://rickandmortyapi.com/api/location"

final class LocationApiController : ObservableObject {
    @Published var locations: [Location] = [Location]()
    @Published var location: Optional<Location> = nil
    
    func loadDataLocations(completion:@escaping (ApiResponse<[Location]>) -> ()){
        guard let url = URL(string: URL_LOCATIONS) else {
            print("Invalid URL!")
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: {data, response, error in
            if error != nil {
                print(error!)
                return
            }
            
            let locations = try! JSONDecoder().decode(ApiResponse<[Location]>.self, from: data!)
            
            DispatchQueue.main.async {
               completion(locations)
            }
        }).resume()
    }
    
    func loadDataLocation(locationID: Int, completion:@escaping (ApiResponse<Location>) -> ()){
        guard let url = URL(string: "\(URL_LOCATIONS)/\(String(locationID))") else {
            print("Invalid URL!")
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: {data, response, error in
            if error != nil {
                print(error!)
                return
            }
            
            let location = try! JSONDecoder().decode(ApiResponse<Location>.self, from: data!)
            
            DispatchQueue.main.async {
               completion(location)
            }
        }).resume()
    }
}
