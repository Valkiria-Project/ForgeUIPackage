//
//  Action.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 27/06/23.
//

import Foundation

public enum Action: Codable, RawRepresentable, Equatable {
    case dismiss
    case closeBottomSheet
    case action(String)

    enum CodingKeys: String, CodingKey {
        case dismiss = "DISMISS"
        case closeBottomSheet = "CLOSE_BOTTOM_SHEET"
    }

    public var rawValue: String {
        switch self {
        case .dismiss: return CodingKeys.dismiss.rawValue
        case .closeBottomSheet: return CodingKeys.closeBottomSheet.rawValue
        case .action(let rawValue): return rawValue
        }
    }

    public init?(rawValue: String) {
        switch CodingKeys(rawValue: rawValue.uppercased()) {
        case .dismiss: self = .dismiss
        case .closeBottomSheet: self = .closeBottomSheet
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
