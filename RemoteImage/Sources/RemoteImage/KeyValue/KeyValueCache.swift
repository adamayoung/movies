//
//  KeyValueCache.swift
//  RemoteImage
//
//  Created by Adam Young on 24/09/2024.
//

import Foundation

public protocol KeyValueCache: Actor {

    func get<CacheItem: Sendable>(forKey key: String) async -> CacheItem?

    func set<CacheItem: Sendable>(_ value: CacheItem?, forKey key: String) async

}
