//
//  RegexValidation.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 8/07/23.
//

import Foundation

public struct RegexValidation: Codable {
    public let regex: String
    public let message: String

    public init(regex: String, message: String) {
        self.regex = regex
        self.message = message
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.regex = try container.decode(String.self, forKey: .regex)
        self.message = try container.decode(String.self, forKey: .message)
    }
}
