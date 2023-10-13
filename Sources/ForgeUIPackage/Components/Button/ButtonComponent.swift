//
//  ButtonComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 27/06/23.
//

import Foundation

public class ButtonComponent: Component {

    public enum Style: String, Codable {
        case loud = "LOUD"
        case quiet = "QUIET"
        case secondary = "SECONDARY"
        case transparent = "TRANSPARENT"
    }

    public enum Size: String, Codable {
        case `default` = "DEFAULT"
        case fullWidth = "FULL_WIDTH"
    }
    
    public private(set) var label: String?
    public private(set) var leftIcon: String?
    public private(set) var style: Style
    public private(set) var size: ButtonComponent.Size
    public private(set) var onClick: Action

    private enum CodingKeys: String, CodingKey {
        case label, style, size
        case onClick = "on_click"
        case leftIcon = "left_icon"
    }

    public init(
        id: String,
        label: String?,
        leftIcon: String?,
        style: Style,
        size: ButtonComponent.Size,
        onClick: Action,
        textStyle: Component.TextStyle,
        margins: Component.Margin,
        arrangement: Component.Arrangement
    ) {
        self.label = label
        self.leftIcon = leftIcon
        self.style = style
        self.onClick = onClick
        self.size = size
        super.init(id: id, textStyle: textStyle, margins: margins, type: .button, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.label = try container.decodeIfPresent(String.self, forKey: .label)
        self.leftIcon = try container.decodeIfPresent(String.self, forKey: .leftIcon)
        self.style = try container.decode(Style.self, forKey: .style)
        self.size = try container.decode(ButtonComponent.Size.self, forKey: .size)
        self.onClick = try container.decode(Action.self, forKey: .onClick)
        try super.init(from: decoder)
    }
}
