//
//  FindingComponent.swift
//  
//
//  Created by Ricardo Grajales Duque on 21/08/23.
//

import Foundation

public class FindingComponent: Component {
    public private(set) var segmentedSwitch: SegmentedSwitch?
    public private(set) var segmentedValue: SegmentedValue?
    private enum CodingKeys: String, CodingKey {
        case segmentedSwitch = "segmented_switch"
        case segmentedValue = "segmented_value"
    }

    public init(
        id: String,
        segmentedSwitch: SegmentedSwitch?,
        segmentedValue: SegmentedValue?,
        textStyle: Component.TextStyle,
        margins: Component.Margin,
        arrangement: Component.Arrangement
    ) {
        self.segmentedSwitch = segmentedSwitch
        self.segmentedValue = segmentedValue
        super.init(id: id, textStyle: textStyle, margins: margins, type: .label, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.segmentedSwitch = try container.decodeIfPresent(SegmentedSwitch.self, forKey: .segmentedSwitch)
        self.segmentedValue = try container.decodeIfPresent(SegmentedValue.self, forKey: .segmentedValue)
        try super.init(from: decoder)
    }
}
