//
//  ComposersView.swift
//  ClassicalPlayerMac
//
//  Created by Frederick Kuhl on 8/14/19.
//  Copyright © 2019 Tyndalesoft LLC. All rights reserved.
//

import SwiftUI

struct ComposersView: View {
    @ObservedObject var mediaLibraryProvider = MediaLibraryProvider.sharedInstance

    var body: some View {
        let piece1 = ComposersPiece(id: 1, name: "Walz", composer: "J Strauss")
        let piece2 = ComposersPiece(id: 2, name: "Another Walz", composer: "J Strauss")
        let pieces = [piece1, piece2]
        let mpiece1 = ComposersPiece(id: 1, name: "Sym 1", composer: "GM")
        let mpiece2 = ComposersPiece(id: 2, name: "Sym 2", composer: "GM")
        let mpieces = [mpiece1, mpiece2]
        let c1 = ComposerComposer(id: 1, name: "J Strauss", pieces: pieces)
        let c2 = ComposerComposer(id: 2, name: "GM", pieces: mpieces)
        let cs = [c1, c2]
        
        /**
        If the List data don't conform to Identifiable, but you have a suitable ID field, use it:
         List(landmarkData, id: \.id)
         */

        return NavigationView {
            List(cs) { composer in
                NavigationLink(destination: ComposerPieces(pieces: composer.pieces)) {
                    ComposerRow(composer: composer)
                }
            }
            .navigationBarTitle(Text("Composers"))
       }
    }

}

#if DEBUG
struct ComposersView_Previews: PreviewProvider {
    static var previews: some View {
        ComposersView()
    }
}
#endif
