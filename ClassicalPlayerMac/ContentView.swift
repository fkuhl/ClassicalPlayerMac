//
//  ContentView.swift
//  ClassicalPlayerMac
//
//  Created by Frederick Kuhl on 8/13/19.
//  Copyright © 2019 Tyndalesoft LLC. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var mediaLibraryProvider = MediaLibraryProvider.sharedInstance
    @State private var selection = 0
    @State private var shoLib = true
 
    var body: some View {
        TabView(selection: $selection) {
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
        .alert(isPresented: $shoLib) {
            Alert(title: Text("iTunes Library Changed"),
                  message: Text("Load newest media?"),
                  primaryButton: .destructive(Text("Load newest media")) {
                    
                },
                  secondaryButton: .default(Text("Skip the load for now")){
                    
                })
        }
//        .actionSheet(isPresented: $shoLib /*$mediaLibraryProvider.showLibraryChanged*/) {
//            ActionSheet(title: Text("iTunes Library Changed"), message: Text("Load newest media?"), buttons: [
//                .cancel(Text("Skip the load for now")) {
//                    //self.mediaLibraryProvider.retrieveMediaLibraryInfo()
//                },
//                .destructive(Text("Load newest media")) {
//                    //self.mediaLibraryProvider.replaceLibraryWithMedia()
//                }])
//        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
