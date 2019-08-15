//
//  ContentView.swift
//  ClassicalPlayerMac
//
//  Created by Frederick Kuhl on 8/13/19.
//  Copyright © 2019 Tyndalesoft LLC. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var mediaLibraryProvider = MediaLibraryProvider()
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            ComposersView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "person.fill")
                        Text("Composers")
                    }
                }
                .tag(0)
            Text("Albums")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "rectangle.stack.fill")
                        Text("Albums")
                    }
                }
                .tag(1)
            Text("Artists")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "guitars")
                        Text("Artists")
                    }
                }
                .tag(2)
            Text("Info")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "info.circle.fill")
                        Text("Info")
                    }
                }
                .tag(3)
            Text("Songs")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "music.note")
                        Text("Songs")
                    }
                }
                .tag(4)
            Text("Playlists")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "music.note.list")
                        Text("Playlists")
                    }
                }
                .tag(5)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
