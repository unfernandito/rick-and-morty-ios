//
//  Character.swift
//  rick-and-morty-app (iOS)
//
//  Created by luis.betancourt on 29/06/2022.
//

import Foundation

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
