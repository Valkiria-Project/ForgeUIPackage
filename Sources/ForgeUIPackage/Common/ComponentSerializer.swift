//
//  ComponentSerializer.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 3/07/23.
//

import Foundation

let componentTypes: [String: Component.Type] = [
    "LABEL": LabelComponent.self,
    "TEXT_FIELD": TextFieldComponent.self,
    "BUTTON": ButtonComponent.self,
    "CHIP": ChipComponent.self,
    "TERMS_AND_CONDITIONS": TermsAndConditionsComponent.self,
    "RICH_LABEL": RichLabelComponent.self,
    "PASSWORD_TEXT_FIELD": PasswordTextFieldComponent.self
]

public struct ComponentSerializer: Codable {
    enum CodingKeys: String, CodingKey {
        case type
    }

    private let _component: Component
    public var component: Component { _component }

    public init(_ component: Component) throws {
        self._component = component
    }

    public init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        let componentType = try keyedContainer.decode(String.self, forKey: .type)

        guard let decodableType = componentTypes[componentType] else {
            throw DecodingError.dataCorruptedError(
                forKey: .type,
                in: keyedContainer,
                debugDescription: "\(componentType) is not registered in componentTypes or does not conform to Decodable."
            )
        }

        self._component = try decodableType.init(from: decoder)
    }

    public func encode(to encoder: Encoder) throws {
        guard let type = componentTypes.first(where: { $1 == type(of: _component) })?.key else {
            let singleValueContainer = encoder.singleValueContainer()
            throw EncodingError.invalidValue(
                _component, .init(
                    codingPath: singleValueContainer.codingPath,
                    debugDescription: "\(type(of: _component)) is not registered or does not conform to Encodable."
                )
            )
        }

        try _component.encode(to: encoder)

        var keyedContainer = encoder.container(keyedBy: CodingKeys.self)
        try keyedContainer.encode(type, forKey: .type)
    }
}
