//
//  FindingComponent.swift
//  
//
//  Created by Ricardo Grajales Duque on 21/08/23.
//

import Foundation

public class FindingComponent: Component {
    public private(set) var segmentedSwitch: SegmentedSwitch

    private enum CodingKeys: String, CodingKey {
        case segmentedSwitch = "segmented_switch"
    }

    public init(
        segmentedSwitch: SegmentedSwitch,
        textStyle: Component.TextStyle,
        margins: Component.Margin,
        arrangement: Component.Arrangement
    ) {
        self.segmentedSwitch = segmentedSwitch
        super.init(textStyle: textStyle, margins: margins, type: .label, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.segmentedSwitch = try container.decode(SegmentedSwitch.self, forKey: .segmentedSwitch)
        try super.init(from: decoder)
    }
}
