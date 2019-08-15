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
import MediaPlayer

public class MediaLibraryProvider: NSObject, ObservableObject {
    public var mediaLibraryState: MediaLibraryState = .authorizationUnknown
    
    private var mediaLibrary = ClassicalMediaLibrary.sharedInstance
    private var didChange = PassthroughSubject<Void,Never>()
    private var libraryAccessChecked = false

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
        checkMediaLibraryAccess()
    }
    
    private func signalChange() {
        DispatchQueue.main.async {
            self.didChange.send(()) //always send on main thread
        }
    }
    
    private func checkMediaLibraryAccess() {
        if libraryAccessChecked { return }
        //Check authorization to access media library
        MPMediaLibrary.requestAuthorization { status in
            switch status {
            case .notDetermined:
            break //not clear how you'd ever get here, as the request will determine authorization
            case .authorized:
                //Avoid the assumption that we know what thread requestAuthorization returns on
                DispatchQueue.main.async {
                    self.mediaLibrary.checkLibraryChanged(context: self.mediaLibrary.mainThreadContext)
                }
            case .restricted:
                self.mediaLibraryState = .authorizationDenied(message:
                    "Media library access restricted by corporate or parental controls")
                self.signalChange()
            case .denied:
                self.mediaLibraryState = .authorizationDenied(message:
                    "Please give ClassicalPlayer access to your Media Library and restart it.")
                self.signalChange()
            @unknown default:  //added on migration to Swift 5
                fatalError("MediaLibraryProvider unknown library access enum")
            }
            self.libraryAccessChecked = true
        }
    }

    
    
    
    // MARK - Notification handlers
    
    @objc
    private func handleDataIsAvailable(notification: NSNotification) {
        mediaLibraryState = .dataAreAvailable
        signalChange()
    }
    
    @objc
    private func handleLibraryChanged(notification: NSNotification) {
        mediaLibraryState = .libraryChanged
        signalChange()
    }
    
    @objc
    private func handleClearingError(notification: NSNotification) {
    }
    
    @objc
    private func handleInitializingError(notification: NSNotification) {
        let message = String(describing: notification.userInfo)
        mediaLibraryState = .initializingError(message: message)
        signalChange()
    }
    
    @objc
    private func handleLoadingError(notification: NSNotification) {
        let message = String(describing: notification.userInfo)
        mediaLibraryState = .loadingError(message: message)
        signalChange()
    }

    @objc
    private func handleSavingError(notification: NSNotification) {
        let message = String(describing: notification.userInfo)
        mediaLibraryState = .savingError(message: message)
        signalChange()
    }
    
    @objc
    private func handleStoreError(notification: NSNotification) {
        let message = String(describing: notification.userInfo)
        mediaLibraryState = .storeError(message: message)
        signalChange()
    }
    
    @objc
    private func  handleDataMissing(notification: NSNotification) {
        //"Some tracks do not have media. This probably can be fixed by synchronizing your device."
        mediaLibraryState = .dataMissing
        signalChange()
    }

}
