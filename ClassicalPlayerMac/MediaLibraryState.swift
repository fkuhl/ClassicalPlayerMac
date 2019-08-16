//
//  MediaLibraryState.swift
//  ClassicalPlayerMac
//
//  Created by Frederick Kuhl on 8/15/19.
//  Copyright © 2019 Tyndalesoft LLC. All rights reserved.
//

import Foundation

public enum MediaLibraryState {
    case authorizationUnknown
    case authorizationDenied(message: String)
    case authorizationGranted
    case libraryChanged
    case dataAreAvailable
    case dataMissing
    case initializingError(message: String)
    case loadingError(message: String)
    case savingError(message: String)
    case storeError(message: String)
    case clearingError(message: String)
}
