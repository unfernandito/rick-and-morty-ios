//
//  Home.swift
//  rick-and-morty-app (iOS)
//
//  Created by luis.betancourt on 29/06/2022.
//

import SwiftUI

struct CharactersList: View {
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
                .overlay{
                    Circle().stroke(CharacterController().getCharacterStatus(status: character.status), lineWidth: 1.5)
                }
                
                // Navigation Button
                NavigationLink(destination: CharacterDetail(character: character)){
                    VStack {
                        HStack {
                            Text(character.name)
                                .font(.headline)
                                .padding(.leading, 10)
                            Spacer()
                        }
                        
                        HStack {
                            Text(character.species)
                                .font(.body)
                                .padding(.leading, 10)
                            Spacer()
                        }
                    }
                }
            }
        }
        .padding(0.0)
        .onAppear(){
            CharacterApiController().loadDataCharacters(completion: {characters in
                self.characters = characters.results
            })
        }
        .refreshable {
            CharacterApiController().loadDataCharacters(completion: {characters in
                self.characters = characters.results
            })
        }
    }
}

struct LocationsList: View {
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
        .refreshable {
            LocationApiController().loadDataLocations(completion: { locations in
                self.locations = locations.results
            })
        }
    }
}

struct EpisodesList: View {
    @State var episodes = [Episode]()
    
    var body: some View {
        List(episodes) { episode in
            VStack(alignment: .leading, spacing: 10) {
                // Navigation Button
                NavigationLink(destination: EpisodeDetail(episode: episode)){
                    HStack {
                        Text(episode.name)
                            .font(.headline)
                    }
                    .padding(.leading, 10)
                }
            }
        }
        .padding(0.0)
        .onAppear(){
            EpisodeApiController().loadDataEpisodes(completion: { episodes in
                self.episodes = episodes.results
            })
        }
        .refreshable {
            EpisodeApiController().loadDataEpisodes(completion: { episodes in
                self.episodes = episodes.results
            })
        }
    }
}

struct HomeView: View {
    @State private var selectedTab = 1
    
    var body: some View {
        return TabView( selection: $selectedTab) {
            CharactersList()
                .tabItem {
                    Label("Characters", systemImage: "person.fill")
                        .foregroundColor(ColorScheme.text)
                }.tag(1)
                .navigationTitle("Rick & Morty")
                .navigationBarTitleDisplayMode(.inline)
            
            LocationsList()
                .tabItem {
                    Label("Locations", systemImage: "sparkles")
                        .foregroundColor(ColorScheme.text)
                }.tag(2)
                .navigationTitle("Rick & Morty")
                .navigationBarTitleDisplayMode(.inline)
            
            EpisodesList()
                .tabItem{
                    Label("Episodes", systemImage: "sparkles")
                        .foregroundColor(ColorScheme.text)
                }.tag(3)
                .navigationTitle("Rick & Morty")
                .navigationBarTitleDisplayMode(.inline)
        }
        .tint(ColorScheme.text)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 13")
            .previewLayout(.sizeThatFits)
    }
}
