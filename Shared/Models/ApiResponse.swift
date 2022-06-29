//
//  ApiResponse.swift
//  rick-and-morty-app (iOS)
//
//  Created by luis.betancourt on 29/06/2022.
//

import Foundation

struct ApiResponse<T : Codable>: Codable {
    var count: Optional<Int>
    var pages: Optional<Int>
    var next: Optional<String>
    var prev: Optional<String>
    var results: T
}
