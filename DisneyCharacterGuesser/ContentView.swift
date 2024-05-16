//
//  ContentView.swift
//  DisneyCharacterGuesser
//
//  Created by Thomas Ogawa on 5/15/24.
//

import SwiftUI

struct ContentView: View {    
    @StateObject private var disneyCharacterViewModel = DisneyCharacterViewModel()
    @State private var showFilms: Bool = true
    @State private var showImg: Bool = true
    var body: some View {
        TabView {
            HowToPlayView()
                .tabItem {
                    Image(systemName: "questionmark.circle.fill")
                    Text("How To Play")
                }
            
            GameScreenView(disneyCharacterViewModel: disneyCharacterViewModel, showFilms: $showFilms, showImg: $showImg)
                .tabItem {
                    Image(systemName: "play")
                    Text("Play Game")
                }
            SettingsView(showFilms: $showFilms, showImg: $showImg)
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
            
    }
}

#Preview {
    ContentView()
}
