//
//  Component.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 26/06/23.
//

import Foundation

protocol Component {}

extension Component {
    var id: UUID { UUID() }
}

//enum ComponentType: String, Codable {
//    case label = "LABEL"
//    case textField
//}

let componentTypes: [String: Component.Type] = [
    "LABEL": LabelComponent.self,
    "TEXTFIELD": TextFieldComponent.self,
    "BUTTON": ButtonComponent.self
]

struct CodableComponent: Codable {
    typealias _CodableComponent = Codable & Component

    enum CodingKeys: String, CodingKey {
        case type
    }

    private let _component: _CodableComponent
    var component: _CodableComponent { _component }

    init(_ component: Component) throws {
        guard let component = component as? _CodableComponent else {
            throw EncodingError.invalidValue(
                component, .init(
                    codingPath: [],
                    debugDescription: "\(type(of: component)) is not encodable."
                )
            )
        }
        self._component = component
    }

    init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        let componentType = try keyedContainer.decode(String.self, forKey: .type)

        guard let decodableType = componentTypes[componentType] as? _CodableComponent.Type else {
            throw DecodingError.dataCorruptedError(
                forKey: .type,
                in: keyedContainer,
                debugDescription: "\(componentType) is not registered in componentTypes or does not conform to Decodable."
            )
        }

        self._component = try decodableType.init(from: decoder) as _CodableComponent
    }

    func encode(to encoder: Encoder) throws {
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
