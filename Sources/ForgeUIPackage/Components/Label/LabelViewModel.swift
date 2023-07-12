//
//  LabelVieModel.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 26/06/23.
//

import Foundation

public class LabelVieModel {
    public let text: String
    public let margins: Component.Margin
    public let textStyle: Component.TextStyle

    public init(component: LabelComponent) {
        text = component.text
        margins = component.margins
        textStyle = component.textStyle
    }
}
