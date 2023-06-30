//
//  Component.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 26/06/23.
//

import Foundation

public protocol Component {}

public typealias IdentifiableComponent = Identifiable & Component

let componentTypes: [String: Component.Type] = [
    "LABEL": LabelComponent.self,
    "TEXT_FIELD": TextFieldComponent.self,
    "BUTTON": ButtonComponent.self
]

public typealias CodableComponent = Codable & Component

public struct ComponentSerializer: Codable {
    enum CodingKeys: String, CodingKey {
        case type
    }

    private let _component: CodableComponent
    public var component: CodableComponent { _component }

    public init(_ component: Component) throws {
        guard let component = component as? CodableComponent else {
            throw EncodingError.invalidValue(
                component, .init(
                    codingPath: [],
                    debugDescription: "\(type(of: component)) is not encodable."
                )
            )
        }
        self._component = component
    }

    public init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        let componentType = try keyedContainer.decode(String.self, forKey: .type)

        guard let decodableType = componentTypes[componentType] as? CodableComponent.Type else {
            throw DecodingError.dataCorruptedError(
                forKey: .type,
                in: keyedContainer,
                debugDescription: "\(componentType) is not registered in componentTypes or does not conform to Decodable."
            )
        }

        self._component = try decodableType.init(from: decoder) as CodableComponent
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
