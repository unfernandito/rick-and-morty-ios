//
//  Home.swift
//  rick-and-morty-app (iOS)
//
//  Created by luis.betancourt on 29/06/2022.
//

import SwiftUI

struct CharactersView: View {
    @State var characters = [Character]()
    
    var body: some View {
            List(characters) { character in
                HStack {
                    // Character Image
                    AsyncImage(url: URL(string: character.image)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    
                    // Navigation Button
                    NavigationLink(destination: CharacterDetail(character: character)){
                        Text("\(character.name)")
                            .font(.body)
                            .padding(.leading, 10)
                    }
                }
            }
        .padding(0.0)
        .onAppear(){
            CharacterApiController().loadDataCharacters(completion: {characters in
                self.characters = characters.results
            })
        }
    }
}

struct LocationsView: View {
    @State var locations = [Location]()
    
    var body: some View {
        List(locations.filter({ element in !element.name.isEmpty && !element.type.isEmpty})) { location in
            VStack(alignment: .leading, spacing: 10) {
                // Navigation Button
                NavigationLink(destination: LocationDetail(location: location)){
                    HStack {
                        Text(location.type)
                            .font(.headline)
                        Text(location.name)
                            .font(.body)
                    }
                    .padding(.leading, 10)
                }
            }
        }
        .padding(0.0)
        .onAppear(){
            LocationApiController().loadDataLocations(completion: { locations in
                self.locations = locations.results
            })
        }
    }
}

struct HomeView: View {
    @State private var selectedTab = 1
    
    var body: some View {
        NavigationView {
            TabView( selection: $selectedTab) {
                CharactersView()
                    .tabItem {
                        Label("Characters", systemImage: "person.fill")
                            
                    }.tag(1)
                    .navigationTitle("Rick & Morty")
                    .navigationBarTitleDisplayMode(.inline)
                
                LocationsView()
                    .tabItem {
                        Label("Locations", systemImage: "sparkles")
                    }.tag(2)
                    .navigationTitle("Rick & Morty")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 13")
            .previewLayout(.sizeThatFits)
    }
}
