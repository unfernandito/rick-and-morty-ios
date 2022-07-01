//
//  rick_and_morty_appTests.swift
//  rick-and-morty-appTests
//
//  Created by luis.betancourt on 01/07/2022.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import rick_and_morty_app

let characterExample = Character(
    id: 2,
    name: "Morty Smith",
    status: "Alive",
    species: "Human",
    type: "",
    gender: "Male",
    origin: LocationSimple(
        name: "example",
        url: ""
    ),
    location: LocationSimple(
        name: "example",
        url: ""
    ),
    image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
    episode: [
        "https://rickandmortyapi.com/api/episode/1",
        "https://rickandmortyapi.com/api/episode/2",
    ],
    url: "https://rickandmortyapi.com/api/character/2",
    created: "2017-11-04T18:50:21.651Z"
)

let locationExample = Location(
    id: 3,
    name: "Citadel of Ricks",
    type: "Space station",
    dimension: "unknown",
    residents: [
      "https://rickandmortyapi.com/api/character/8",
      "https://rickandmortyapi.com/api/character/14",
      // ...
    ],
    url: "https://rickandmortyapi.com/api/location/3",
    created: "2017-11-10T13:08:13.191Z"
)

class rick_and_morty_appTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewInspectorBaseLine() throws {
        let expected = "Rick & Morty"
        let sut = Text(expected)
        let value = try sut.inspect().text().string()
        
        XCTAssertEqual(value, expected)
    }
    
    func testHomeView() throws {
        let home_view = HomeView()
        let tab_characters_text = "Characters"
        let tab_locations_text = "Locations"
        
        let inspectedCharacterTabName = try home_view
            .inspect()
            .find(text: tab_characters_text)
            .string()
        
        XCTAssertEqual(inspectedCharacterTabName, tab_characters_text)
        
        let inspectedLocationsTabName = try home_view
            .inspect()
            .find(text: tab_locations_text)
            .string()
        
        XCTAssertEqual(inspectedLocationsTabName, tab_locations_text)
    }
    
    func testCharaactersView() throws {
        let characters_view = CharactersView(characters: [characterExample])
        let main_character = "Morty Smith"
        
        let inspectedName = try characters_view
            .inspect()
            .find(text: main_character)
            .string()
        
        XCTAssertEqual(main_character, inspectedName)
    }
    
    func testLocationsView() throws {
        let locations_view = LocationsView(locations: [locationExample])
        let main_location = "Citadel of Ricks"
        
        let inspectedName = try locations_view
            .inspect()
            .find(text: main_location)
            .string()
        
        XCTAssertEqual(main_location, inspectedName)
    }

}
