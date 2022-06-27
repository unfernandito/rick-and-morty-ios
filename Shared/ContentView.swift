//
//  ContentView.swift
//  Shared
//
//  Created by luis.betancourt on 27/06/2022.
//

import SwiftUI

struct ContentView: View {
    @State var characters = [Character]()
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                List(characters) { character in
                    Button(action: {
                        showAlert = true
                    }, label: {
                        VStack {
                            AsyncImage(url: URL(string: character.image)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 128, height: 128)
                            
                            Text("\(character.name)")
                                
                        }
                    })
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Development"), message: Text("Working Progress!"))
                    }
                }
                .onAppear(){
                    ApiRickAndMorty().loadDataCharacters(completion: {characters in
                        self.characters = characters.results
                    })
                }
            }.navigationTitle("Characters")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
