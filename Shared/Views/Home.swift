//
//  Home.swift
//  rick-and-morty-app (iOS)
//
//  Created by luis.betancourt on 29/06/2022.
//

import SwiftUI

struct HomeView: View {
    @State var characters = [Character]()
    
    var body: some View {
        NavigationView {
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
                    ApiController().loadDataCharacters(completion: {characters in
                        self.characters = characters.results
                    })
                }
            }
            .padding(0.0)
            .navigationTitle("Rick and Morty")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .previewDevice("iPhone 13")
                .previewLayout(.sizeThatFits)
        }
    }
}
