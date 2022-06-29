//
//  Location.swift
//  rick-and-morty-app (iOS)
//
//  Created by luis.betancourt on 29/06/2022.
//

import Foundation

struct Location: Codable, Identifiable {
    var id: Int
    var name: String
    var dimension: String
    var residents: [String]
    var url: String
    var created: String
}

struct LocationSimple: Codable {
    var name: String
    var url: String
}
