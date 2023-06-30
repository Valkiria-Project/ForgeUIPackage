//
//  ButtonComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 27/06/23.
//

import Foundation

public struct ButtonComponent: Component, Codable, Identifiable {

    public enum ButtonStyle: String, Codable {
        case loud = "LOUD"
        case quiet = "QUIET"
        case secondary = "SECONDARY"
    }

    public let id: UUID
    public private(set) var label: String?
    public private(set) var icon: String?
    public private(set) var style: ButtonStyle
    public private(set) var onClick: Action
    public private(set) var margins: Margin

    public init(label: String?, icon: String?, style: ButtonStyle, onClick: Action, margins: Margin) {
        self.id = UUID()
        self.label = label
        self.icon = icon
        self.style = style
        self.onClick = onClick
        self.margins = margins
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.label = try container.decodeIfPresent(String.self, forKey: .label)
        self.icon = try container.decodeIfPresent(String.self, forKey: .icon)
        self.style = try container.decode(ButtonStyle.self, forKey: .style)
        self.onClick = try container.decode(Action.self, forKey: .onClick)
        self.margins = try container.decode(Margin.self, forKey: .margins)
    }
}

extension ButtonComponent {

    static func quietIconOnlyButtonExample() throws -> Self {
        let component: ButtonComponent = try SerializationHelper.fromJsonResource(named: "QuietIconButtonComponent")
        return component
    }

    static func quietTextAndIconButtonExample() throws -> Self {
        let component: ButtonComponent = try SerializationHelper.fromJsonResource(named: "QuietTextAndIconButtonComponent")
        return component
    }

    static func quietTextOnlyButtonExample() throws -> Self {
        let component: ButtonComponent = try SerializationHelper.fromJsonResource(named: "QuietTextButtonComponent")
        return component
    }

    static func loudIconOnlyButtonExample() throws -> Self {
        let component: ButtonComponent = try SerializationHelper.fromJsonResource(named: "LoudIconButtonComponent")
        return component
    }

    static func loudTextAndIconButtonExample() throws -> Self {
        let component: ButtonComponent = try SerializationHelper.fromJsonResource(named: "LoudTextAndIconButtonComponent")
        return component
    }

    static func loudTextOnlyButtonExample() throws -> Self {
        let component: ButtonComponent = try SerializationHelper.fromJsonResource(named: "LoudTextButtonComponent")
        return component
    }

    static func secondaryIconOnlyButtonExample() throws -> Self {
        let component: ButtonComponent = try SerializationHelper.fromJsonResource(named: "SecondaryIconButtonComponent")
        return component
    }

    static func secondaryTextAndIconButtonExample() throws -> Self {
        let component: ButtonComponent = try SerializationHelper.fromJsonResource(named: "SecondaryTextAndIconButtonComponent")
        return component
    }

    static func secondaryTextOnlyButtonExample() throws -> Self {
        let component: ButtonComponent = try SerializationHelper.fromJsonResource(named: "SecondaryTextButtonComponent")
        return component
    }
}
