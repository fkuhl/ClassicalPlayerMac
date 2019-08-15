//
//  MediaLibraryProvider.swift
//  ClassicalPlayerMac
//
//  Created by Frederick Kuhl on 8/15/19.
//  Copyright © 2019 Tyndalesoft LLC. All rights reserved.
//

import Foundation
import Combine
import CoreData

public class MediaLibraryProvider: NSObject, ObservableObject {
    var didChange = PassthroughSubject<Void,Never>()
    public var mediaLibraryState: MediaLibraryState = .authorizationUnknown
    
    override init() {
        super.init()
        NotificationCenter.default.addObserver(self,
                                                selector: #selector(handleDataIsAvailable),
                                                name: .dataAvailable,
                                                object: nil)
         NotificationCenter.default.addObserver(self,
                                                selector: #selector(handleLibraryChanged),
                                                name: .libraryChanged,
                                                object: nil)
         NotificationCenter.default.addObserver(self,
                                                selector: #selector(handleClearingError),
                                                name: .clearingError,
                                                object: nil)
         NotificationCenter.default.addObserver(self,
                                                selector: #selector(handleInitializingError),
                                                name: .initializingError,
                                                object: nil)
         NotificationCenter.default.addObserver(self,
                                                selector: #selector(handleLoadingError),
                                                name: .loadingError,
                                                object: nil)
         NotificationCenter.default.addObserver(self,
                                                selector: #selector(handleSavingError),
                                                name: .savingError,
                                                object: nil)
         NotificationCenter.default.addObserver(self,
                                                selector: #selector(handleStoreError),
                                                name: .storeError,
                                                object: nil)
         NotificationCenter.default.addObserver(self,
                                                selector: #selector(handleDataMissing),
                                                name: .dataMissing,
                                                object: nil)
    }
    
    
    // MARK - Notification handlers
    
    @objc
    private func handleDataIsAvailable() {
    }
    
    @objc
    private func handleLibraryChanged() {
    }
    
    @objc
    private func handleClearingError(notification: NSNotification) {
    }
    
    @objc
    private func handleInitializingError(notification: NSNotification) {
    }
    
    @objc
    private func handleLoadingError(notification: NSNotification) {
    }

    @objc
    private func handleSavingError(notification: NSNotification) {
    }
    
    @objc
    private func handleStoreError(notification: NSNotification) {
    }

}
