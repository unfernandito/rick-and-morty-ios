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
        VStack(alignment: .leading, spacing: 10) {
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
            .onAppear(){
                CharacterApiController().loadDataCharacters(completion: {characters in
                    self.characters = characters.results
                })
            }
        }
        .padding(0.0)
    }
}

struct LocationsView: View {
    @State var locations = [Location]()
    @State private var showAlert = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            List(locations) { location in
                HStack {
                    // Navigation Button
                    NavigationLink(destination: LocationDetail()){
                        Text("iddddd \(location.name)")
                            .font(.body)
                            .padding(.leading, 10)
                    }
                    
                }
            }
            .onAppear(){
                LocationApiController().loadDataLocations(completion: { locations in
                    print(locations)
                    
                    self.locations = locations.results
                    self.showAlert = true
                })
            }
            .alert(isPresented: $showAlert) {
                Alert(title:  Text("me carge"), message: Text("si señor"))
            }
        }
        .padding(0.0)
    }
}

struct HomeView: View {
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView {
            CharactersView()
                .tabItem {
                    Label("Characters", systemImage: "tray.fill")
                        .onTapGesture {
                            selectedTab = "Two"
                        }
                        .tag("One")
                }
            
            LocationsView()
            .tabItem {
                Label("Locations", systemImage: "sparkles")
                    .tag("Two")
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
