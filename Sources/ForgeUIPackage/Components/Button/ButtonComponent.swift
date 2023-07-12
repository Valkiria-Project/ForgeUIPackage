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
    public private(set) var icon: String?
    public private(set) var style: Style
    public private(set) var size: ButtonComponent.Size
    public private(set) var onClick: Action

    private enum CodingKeys: String, CodingKey {
        case label, icon, style, size
        case onClick = "on_click"
    }

    public init(
        identifier: Component.Identifier? = nil,
        label: String?,
        icon: String?,
        style: Style,
        size: ButtonComponent.Size,
        onClick: Action,
        textStyle: Component.TextStyle,
        margins: Component.Margin
    ) {
        self.label = label
        self.icon = icon
        self.style = style
        self.onClick = onClick
        self.size = size
        super.init(identifier: identifier, textStyle: textStyle, margins: margins, type: .button)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.label = try container.decodeIfPresent(String.self, forKey: .label)
        self.icon = try container.decodeIfPresent(String.self, forKey: .icon)
        self.style = try container.decode(Style.self, forKey: .style)
        self.size = try container.decode(ButtonComponent.Size.self, forKey: .size)
        self.onClick = try container.decode(Action.self, forKey: .onClick)
        try super.init(from: decoder)
    }
}

extension ButtonComponent {

    static func quietTextAndIconButtonExample() throws -> ButtonComponent {
        let component: ButtonComponent = try fromJsonResource(named: "QuietTextAndIconButtonComponent")
        return component
    }

    static func loudTextAndIconButtonExample() throws -> ButtonComponent {
        let component: ButtonComponent = try fromJsonResource(named: "LoudTextAndIconButtonComponent")
        return component
    }

    static func secondaryTextAndIconButtonExample() throws -> ButtonComponent {
        let component: ButtonComponent = try fromJsonResource(named: "SecondaryTextAndIconButtonComponent")
        return component
    }

    static func transparentButtonExample() throws -> ButtonComponent {
        let component: ButtonComponent = try fromJsonResource(named: "TransparentButtonComponent")
        return component
    }
}
