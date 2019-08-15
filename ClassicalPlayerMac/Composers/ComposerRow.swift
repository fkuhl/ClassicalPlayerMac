//
//  ComposerRow.swift
//  ClassicalPlayerMac
//
//  Created by Frederick Kuhl on 8/14/19.
//  Copyright © 2019 Tyndalesoft LLC. All rights reserved.
//

import SwiftUI

struct ComposerRow: View {
    var composer: ComposerComposer
    
    var body: some View {
        Text(composer.name)
    }
}

#if DEBUG
struct ComposerRow_Previews: PreviewProvider {
    static var previews: some View {
        ComposerRow(composer: ComposerComposer(id: 1, name: "J Strauss", pieces:
            [ComposersPiece(id: 1, name: "Walz", composer: "J Strauss"),
             ComposersPiece(id: 2, name: "Another Walz", composer: "J Strauss")]))
    }
}
#endif
