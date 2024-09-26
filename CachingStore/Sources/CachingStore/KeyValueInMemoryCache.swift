//
//  KeyValueInMemoryCache.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

public actor KeyValueInMemoryCache: KeyValueCache {

    private let cache = NSCache<NSString, Box>()

    public init() {}

    public func get<CacheItem: Sendable>(forKey key: String) async -> CacheItem? {
        let nsKey = key as NSString
        guard let cacheItem = cache.object(forKey: nsKey)?.value as? CacheItem else {
            print("Cache MISS: \(key)")
            return nil
        }

        print("Cache HIT: \(key)")
        return cacheItem
    }

    public func set(_ value: some Sendable, forKey key: String) async {
        let nsKey = key as NSString

        cache.setObject(Box(value), forKey: nsKey)
        print("Cache SET: \(key)")
    }

    public func remove(withKey key: String) async {
        let nsKey = key as NSString

        cache.removeObject(forKey: nsKey)
        print("Cache REMOVE: \(key)")
    }

}

extension KeyValueInMemoryCache {

    private final class Box: AnyObject {
        let value: Any

        init(_ value: Any) {
            self.value = value
        }
    }

}
