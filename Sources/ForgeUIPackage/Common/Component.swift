//
//  Component.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 26/06/23.
//

import Foundation

public class Component: Identifiable, Codable {

    public enum Identifier: String, Codable {
        case loginEmail = "LOGIN_EMAIL"
        case loginPassword = "LOGIN_PASSWORD"
        case loginButton = "LOGIN_BUTTON"
        case loginForgotPassword = "LOGIN_FORGOT_PASSWORD_BUTTON"
    }

    public enum ComponentType: String, Codable {
        case label = "LABEL"
        case textField = "TEXT_FIELD"
        case button = "BUTTON"
        case chip = "CHIP"
        case termsAndConditions = "TERMS_AND_CONDITIONS"
        case richLabel = "RICH_LABEL"
        case passwordTextField = "PASSWORD_TEXT_FIELD"
    }

    public enum TextStyle: String, Codable {
        case headline1 = "HEADLINE_1"
        case headline2 = "HEADLINE_2"
        case headline3 = "HEADLINE_3"
        case headline4 = "HEADLINE_4"
        case headline5 = "HEADLINE_5"
        case headline6 = "HEADLINE_6"
        case headline7 = "HEADLINE_7"
        case headline8 = "HEADLINE_8"
        case body1 = "BODY_1"
        case button1 = "BUTTON_1"
        case button2 = "BUTTON_2"
    }

    public let id: UUID
    public let identifier: Identifier?
    public let textStyle: TextStyle?
    public let margins: Margin
    public let type: ComponentType

    enum CodingKeys: String, CodingKey {
        case margins, id, identifier, type
        case textStyle = "text_style"
    }

    init(
        identifier: Identifier? = nil,
        textStyle: TextStyle,
        margins: Margin,
        type: ComponentType
    ) {
        self.id = UUID()
        self.identifier = identifier
        self.textStyle = textStyle
        self.margins = margins
        self.type = type
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.textStyle = try container.decodeIfPresent(TextStyle.self, forKey: .textStyle)
        self.margins = try container.decode(Margin.self, forKey: .margins)
        self.type = try container.decode(ComponentType.self, forKey: .type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encode(self.textStyle, forKey: .textStyle)
        try container.encode(self.margins, forKey: .margins)
        try container.encode(self.type, forKey: .type)
    }
}
