//
//  Action.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 27/06/23.
//

import Foundation

public struct Action: Codable {
    public let type: ActionType

    public init(type: ActionType) {
        self.type = type
    }
}

public enum ActionType: Codable, RawRepresentable, Equatable {
    case deviceAuth
    case dismiss
    case action(String)

    enum CodingKeys: String, CodingKey {
        case dismiss = "DISMISS"
        case deviceAuth = "DEVICE_AUTH"
    }

    public var rawValue: String {
        switch self {
        case .deviceAuth: return CodingKeys.deviceAuth.rawValue
        case .dismiss: return CodingKeys.dismiss.rawValue
        case .action(let rawValue): return rawValue
        }
    }

    public init?(rawValue: String) {
        switch CodingKeys(rawValue: rawValue.uppercased()) {
        case .deviceAuth: self = .deviceAuth
        case .dismiss: self = .dismiss
        default: self = .action(rawValue)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        self = .init(rawValue: rawValue) ?? .action(rawValue)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
