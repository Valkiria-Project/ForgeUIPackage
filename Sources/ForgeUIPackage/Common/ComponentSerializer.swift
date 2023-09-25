//
//  ComponentSerializer.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 3/07/23.
//

import Foundation

let componentTypes: [String: Component.Type] = [
    Component.ComponentType.label.rawValue: LabelComponent.self,
    Component.ComponentType.textField.rawValue: TextFieldComponent.self,
    Component.ComponentType.button.rawValue: ButtonComponent.self,
    Component.ComponentType.chip.rawValue: ChipComponent.self,
    Component.ComponentType.termsAndConditions.rawValue: TermsAndConditionsComponent.self,
    Component.ComponentType.richLabel.rawValue: RichLabelComponent.self,
    Component.ComponentType.passwordTextField.rawValue: PasswordTextFieldComponent.self,
    Component.ComponentType.segmentedSwitch.rawValue: SegmentedSwitch.self,
    Component.ComponentType.card.rawValue: CardComponent.self,
    Component.ComponentType.reportDetail.rawValue: ReportDetailComponent.self,
    Component.ComponentType.fingerprint.rawValue: FingerprintComponent.self,
    Component.ComponentType.filters.rawValue: FilterComponent.self,
    Component.ComponentType.chipOptions.rawValue: ChipOptionComponent.self,
    Component.ComponentType.finding.rawValue: FindingComponent.self,
    Component.ComponentType.detailedInfoList.rawValue: DetailedInfoListComponent.self,
    Component.ComponentType.inventoryCheck.rawValue: InventoryCheckComponent.self,
    Component.ComponentType.header.rawValue: Header.self,
    Component.ComponentType.slider.rawValue: SliderComponent.self,
    Component.ComponentType.chipSelection.rawValue: ChipSelectionComponent.self,
    Component.ComponentType.dropDown.rawValue: DropDownComponent.self,
    Component.ComponentType.imageButton.rawValue: ImageButtonComponent.self,
    Component.ComponentType.imageButtonSection.rawValue: ImageButtonSectionComponent.self,
    Component.ComponentType.humanBody.rawValue: HumanBodyComponent.self,
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
