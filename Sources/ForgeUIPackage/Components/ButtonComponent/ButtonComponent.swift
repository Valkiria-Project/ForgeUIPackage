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
    
    public private(set) var label: String?
    public private(set) var icon: String?
    public private(set) var style: Style
    public private(set) var onClick: Action

    private enum CodingKeys: String, CodingKey {
        case label, icon, style, onClick
    }

    public init(
        identifier: Component.Identifier? = nil,
        label: String?,
        icon: String?,
        style: Style,
        onClick: Action,
        margins: Margin
    ) {
        self.label = label
        self.icon = icon
        self.style = style
        self.onClick = onClick
        super.init(identifier: identifier, margins: margins)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.label = try container.decodeIfPresent(String.self, forKey: .label)
        self.icon = try container.decodeIfPresent(String.self, forKey: .icon)
        self.style = try container.decode(Style.self, forKey: .style)
        self.onClick = try container.decode(Action.self, forKey: .onClick)
        try super.init(from: decoder)
    }
}

extension ButtonComponent {

    static func quietIconOnlyButtonExample() throws -> ButtonComponent {
        let component: ButtonComponent = try fromJsonResource(named: "QuietIconButtonComponent")
        return component
    }

    static func quietTextAndIconButtonExample() throws -> ButtonComponent {
        let component: ButtonComponent = try fromJsonResource(named: "QuietTextAndIconButtonComponent")
        return component
    }

    static func quietTextOnlyButtonExample() throws -> ButtonComponent {
        let component: ButtonComponent = try fromJsonResource(named: "QuietTextButtonComponent")
        return component
    }

    static func loudIconOnlyButtonExample() throws -> ButtonComponent {
        let component: ButtonComponent = try fromJsonResource(named: "LoudIconButtonComponent")
        return component
    }

    static func loudTextAndIconButtonExample() throws -> ButtonComponent {
        let component: ButtonComponent = try fromJsonResource(named: "LoudTextAndIconButtonComponent")
        return component
    }

    static func loudTextOnlyButtonExample() throws -> ButtonComponent {
        let component: ButtonComponent = try fromJsonResource(named: "LoudTextButtonComponent")
        return component
    }

    static func secondaryIconOnlyButtonExample() throws -> ButtonComponent {
        let component: ButtonComponent = try fromJsonResource(named: "SecondaryIconButtonComponent")
        return component
    }

    static func secondaryTextAndIconButtonExample() throws -> ButtonComponent {
        let component: ButtonComponent = try fromJsonResource(named: "SecondaryTextAndIconButtonComponent")
        return component
    }

    static func secondaryTextOnlyButtonExample() throws -> ButtonComponent {
        let component: ButtonComponent = try fromJsonResource(named: "SecondaryTextButtonComponent")
        return component
    }

    static func transparentButtonExample() throws -> ButtonComponent {
        let component: ButtonComponent = try fromJsonResource(named: "TransparentButtonComponent")
        return component
    }
}
