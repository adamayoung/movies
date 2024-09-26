//
//  ImageDownloader+SwiftUI.swift
//  RemoteImage
//
//  Created by Adam Young on 23/09/2024.
//

#if canImport(SwiftUI)
    import SwiftUI

    public extension EnvironmentValues {

        @Entry var imageDownloader = ImageDownloader()

    }
#endif
