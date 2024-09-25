//
//  Item.swift
//  Movies
//
//  Created by Adam Young on 25/09/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date

    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
