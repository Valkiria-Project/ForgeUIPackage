//
//  ButtonViewModel.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 27/06/23.
//

import Foundation

public class ButtonViewModel {

    public let identifier: Component.Identifier?
    public let label: String?
    public let icon: String?
    public let style: ButtonComponent.Style
    public let size: ButtonComponent.Size?
    public let textStyle: ButtonComponent.TextStyle?
    public let margins: Component.Margin
    public var buttonAction: () -> Void

    public init(component: ButtonComponent, buttonAction: @escaping (Action) -> Void) {
        identifier = component.identifier
        label = component.label
        icon = component.icon
        style = component.style
        size = component.size
        textStyle = component.textStyle
        margins = component.margins
        self.buttonAction = {
            buttonAction(component.onClick)
        }
    }
}
