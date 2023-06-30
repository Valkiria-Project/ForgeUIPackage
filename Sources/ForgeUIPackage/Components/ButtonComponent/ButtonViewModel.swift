//
//  ButtonViewModel.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 27/06/23.
//

import Foundation

public class ButtonViewModel {

    let label: String?
    var icon: String?
    let style: ButtonComponent.Style
    let action: Action
    let margins: Margin

    public init(component: ButtonComponent) {
        label = component.label
        icon = component.icon
        style = component.style
        action = component.onClick
        margins = component.margins
    }
}
