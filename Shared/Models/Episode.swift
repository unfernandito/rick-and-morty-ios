//
//  Episode.swift
//  rick-and-morty-appTests
//
//  Created by luis.betancourt on 04/07/2022.
//

import Foundation

struct Episode: Codable, Identifiable {
    var id: Int
    var name: String
    var air_date: String
    var episode: String
    var characters: [String]
    var url: String
    var created: String
}
