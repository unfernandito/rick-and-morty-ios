//
//  CharacterDetail.swift
//  rick-and-morty-app (iOS)
//
//  Created by luis.betancourt on 29/06/2022.
//

import SwiftUI

struct CharacterDetail: View {
    @State var character: Optional<Character> = nil
    
    var body: some View {
        if character != nil {
            let characterSafe = character!
            VStack(spacing: 30) {
                AsyncImage(url: URL(string: characterSafe.image)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 240, height: 240)
                .clipShape(Circle())
                .overlay{
                    Circle().stroke(.gray, lineWidth: 1)
                }
                .shadow(radius: 12)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Status:")
                            .padding(.leading, 10)
                            .font(.headline)
                        
                        Text("\(characterSafe.status)")
                    }
                    Divider()
                    
                    HStack {
                        Text("Specie:")
                            .padding(.leading, 10)
                            .font(.headline)
                        
                        Text("\(characterSafe.species)")
                    }
                    Divider()
                    
                    HStack {
                        Text("Gender:")
                            .padding(.leading, 10)
                            .font(.headline)
                        
                        Text("\(characterSafe.gender)")
                    }
                }
                
                Spacer()
            }
            .padding(.top, 15.0)
            .navigationTitle("\(characterSafe.id)-\(characterSafe.name) Detail")
            .navigationBarTitleDisplayMode(.inline)
            .background(.ultraThickMaterial)
        } else {
            ProgressView()
        }
    }
}

struct CharacterDetail_Previews: PreviewProvider {
    static var previews: some View {
        let exampleCharacter: Character = Character(
            id: 2,
            name: "Morty Smith",
            status: "Alive",
            species: "Human",
            type: "",
            gender: "Male",
            image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
            episode: [
                "https://rickandmortyapi.com/api/episode/1",
                "https://rickandmortyapi.com/api/episode/2",
            ],
            url: "https://rickandmortyapi.com/api/character/2",
            created: "2017-11-04T18:50:21.651Z"
        )
        CharacterDetail(character: exampleCharacter)
    }
}
