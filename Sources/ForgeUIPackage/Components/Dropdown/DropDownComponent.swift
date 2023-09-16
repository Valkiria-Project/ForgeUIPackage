//
//  DropDownComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 13/09/23.
//

import Foundation

public struct DropDownItem: Codable {
    public let id: String
    public let name: String
}

public class DropDownComponent: Component {
    public let label: String
    public let options: [DropDownItem]
    public let selected: String?

    private enum CodingKeys: String, CodingKey {
        case label, options, selected
    }

    public init(
        id: String,
        margins: Component.Margin,
        type: Component.ComponentType,
        arrangement: Component.Arrangement,
        label: String,
        options: [DropDownItem],
        selected: String
    ) {
        self.label = label
        self.options = options
        self.selected = selected
        super.init(id: id, margins: margins, type: .dropDown, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.label = try container.decode(String.self, forKey: .label)
        self.options = try container.decode([DropDownItem].self, forKey: .options)
        self.selected = try container.decodeIfPresent(String.self, forKey: .selected)
        try super.init(from: decoder)
    }

}
