//
//  EpisodeDetail.swift
//  rick-and-morty-app
//
//  Created by luis.betancourt on 04/07/2022.
//

import SwiftUI

struct EpisodeDetail: View {
    @State  var episode: Optional<Episode> = nil
    
    var body: some View {
        if episode != nil {
            let episodeSafe = episode!
            
            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    Text("Air Date:")
                    Text(episodeSafe.air_date)
                }
                Divider()
                HStack {
                    Text("Episode:")
                    Text(episodeSafe.episode)
                }
                Divider()
                HStack {
                    Text("Characters:")
                    VStack{
                        ForEach(episodeSafe.characters, id: \.self){ character in
                            Text("- \(character)")
                        }
                    }
                }
                Divider()
                HStack {
                    Text("URL:")
                    Text(episodeSafe.url)
                }
                Divider()
                HStack {
                    Text("Created at:")
                    Text(episodeSafe.created)
                }
                
                Spacer()
            }
            .padding(0.0)
            .navigationTitle(episodeSafe.name)
        } else {
            ProgressView()
        }
    }
}

struct EpisodeDetail_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetail(episode: Episode(
            id: 1, name: "test", air_date: "test air_date", episode: "test", characters: ["test"], url: "test", created: "test"
        ))
    }
}
