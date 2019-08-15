//
//  ComposerPieces.swift
//  ClassicalPlayerMac
//
//  Created by Frederick Kuhl on 8/14/19.
//  Copyright © 2019 Tyndalesoft LLC. All rights reserved.
//

import SwiftUI

struct ComposerPieces: View {
    var pieces: [ComposersPiece]
    var body: some View {
        
        return List(pieces) { piece in
            VStack(alignment: .leading) {
                Text(piece.name).font(.largeTitle)
                Text(piece.composer).font(.caption)
            }
        }
    }
}

#if DEBUG
struct ComposerPieces_Previews: PreviewProvider {
    static var previews: some View {
        ComposerPieces(pieces: [
            ComposersPiece(id: 1, name: "Walz", composer: "J Strauss"),
            ComposersPiece(id: 2, name: "Some Stuff", composer: "J Strauss")])
    }
}
#endif
