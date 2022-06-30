//
//  LocationDetail.swift
//  rick-and-morty-app (iOS)
//
//  Created by luis.betancourt on 29/06/2022.
//

import SwiftUI

struct LocationDetail: View {
    @State var location: Optional<Location> = nil
    var body: some View {
        if location != nil {
            let locationSafe = location!
            
            VStack(spacing: 30){
                VStack(alignment: .leading) {
                    HStack {
                        Text("Name: ")
                            .font(.headline)
                        Text(locationSafe.name)
                            .font(.body)
                    }
                    .padding(.leading, 10)
                    Divider()
                    
                    HStack {
                        Text("Type: ")
                            .font(.headline)
                        Text(locationSafe.type)
                            .font(.body)
                    }
                    .padding(.leading, 10)
                    Divider()
                    
                    HStack {
                        Text("Dimension: ")
                            .font(.headline)
                        Text(locationSafe.dimension)
                            .font(.body)
                    }
                    .padding(.leading, 10)
                    Divider()
                    
                    HStack {
                        Text("Residents: ")
                            .font(.headline)
                    
                        VStack(spacing: 5) {
                            ForEach(locationSafe.residents, id: \.self) { element in
                                Text("* \(element)")
                                    .font(.body)
                            }
                        }
                    }
                    .padding(.leading, 10)
                    Divider()
                    
                    HStack {
                        Text("Created at: ")
                            .font(.headline)
                        Text(locationSafe.created)
                            .font(.body)
                    }
                    .padding(.leading, 10)
                }
            }
            .padding(0.0)
            .navigationTitle(String(locationSafe.id))
            .navigationBarTitleDisplayMode(.inline)
        } else {
            ProgressView()
        }
    }
}

struct LocationDetail_Previews: PreviewProvider {
    static var previews: some View {
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
        LocationDetail(location: locationExample)
    }
}
