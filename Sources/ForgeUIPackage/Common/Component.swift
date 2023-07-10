//
//  Component.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 26/06/23.
//

import Foundation

public class Component: Identifiable, Codable {

    public enum Identifier: String, Codable {
        case emailTextField = "EMAIL_TEXT_FIELD"
        case passwordTextField = "PASSWORD_TEXT_FIELD"
        case loginButton = "LOGIN_BUTTON"
        case forgotPasswordButton = "FORGOT_PASSWORD_BUTTON"
    }

    public enum ComponentType: String, Codable {
        case label = "LABEL"
        case textField = "TEXT_FIELD"
        case button = "BUTTON"
        case chip = "CHIP"
        case termsAndConditions = "TERMS_AND_CONDITIONS"
    }

    public let id: UUID
    public let identifier: Identifier?
    public let margins: Margin
    public let type: ComponentType

    enum CodingKeys: CodingKey {
        case margins, id, identifier, type
    }

    public init(identifier: Identifier? = nil, margins: Margin, type: ComponentType) {
        self.id = UUID()
        self.identifier = identifier
        self.margins = margins
        self.type = type
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.margins = try container.decode(Margin.self, forKey: .margins)
        self.type = try container.decode(ComponentType.self, forKey: .type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encode(self.margins, forKey: .margins)
        try container.encode(self.type, forKey: .type)
    }
}
