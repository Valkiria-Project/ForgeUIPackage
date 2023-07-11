//
//  File.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 10/07/23.
//

import Foundation

public class RichLabelViewModel {
    public let text: String
    public let margins: Margin
    public let style: RichLabelComponent.Style

    public init(component: RichLabelComponent) {
        text = component.text
        margins = component.margins
        style = component.style
    }
}
