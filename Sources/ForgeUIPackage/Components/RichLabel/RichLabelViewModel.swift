//
//  File.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 10/07/23.
//

import Foundation

public class RichLabelViewModel {
    public let text: String
    public let margins: Component.Margin
    public let textStyle: Component.TextStyle

    public init(component: RichLabelComponent) {
        text = component.text
        margins = component.margins
        textStyle = component.textStyle

    }
}
