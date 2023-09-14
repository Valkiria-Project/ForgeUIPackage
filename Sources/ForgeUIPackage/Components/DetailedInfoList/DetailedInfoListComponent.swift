//
//  DetailedInfoListComponent.swift
//  
//
//  Created by Ricardo Grajales Duque on 22/08/23.
//

import Foundation

public class DetailedInfoListComponent: Component {
    public var details: [DetailedInfo]

    private enum CodingKeys: String, CodingKey {
        case details
    }

    public init(
        id: String,
        details: [DetailedInfo],
        margins: Component.Margin,
        arrangement: Component.Arrangement
    ) {
        self.details = details
        super.init(id: id, margins: margins, type: .detailedInfoList, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.details =  try container.decode([DetailedInfo].self, forKey: .details)
        try super.init(from: decoder)
    }
}

public struct DetailedInfo: Codable, Identifiable {
    public var id: String {
        return label + icon + text
    }
    public var label: String
    public var icon: String
    public var text: String

    public init(label: String, icon: String, text: String) {
        self.label = label
        self.icon = icon
        self.text = text
    }
}
