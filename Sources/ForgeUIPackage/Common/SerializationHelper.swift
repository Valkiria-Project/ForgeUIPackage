//
//  SerializationHelper.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 26/06/23.
//

import Foundation

private final class BundleClass {}

extension Bundle {
    static let bundleResources = Bundle(for: BundleClass.self)

    func loadJsonData(named name: String) throws -> Data {
        guard let url = Bundle.module.url(forResource: name, withExtension: "json") else {
            throw BundleError.resourceNotFound
        }
        return try Data(contentsOf: url)
    }
}

enum BundleError: Error {
    case resourceNotFound
}

struct SerializationHelper {
    static func fromJsonResource<T: Codable>(named: String) throws -> T {
        let data = try Bundle.bundleResources.loadJsonData(named: named)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
