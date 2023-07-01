//
//  ButtonViewModel.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 27/06/23.
//

import Foundation

public class ButtonViewModel {

    public let label: String?
    public let icon: String?
    public let style: ButtonComponent.Style
    public let action: Action
    public let margins: Margin

    public init(component: ButtonComponent) {
        label = component.label
        icon = component.icon
        style = component.style
        action = component.onClick
        margins = component.margins
    }
}
