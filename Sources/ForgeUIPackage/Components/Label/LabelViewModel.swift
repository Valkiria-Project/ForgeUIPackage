//
//  LabelVieModel.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 26/06/23.
//

import Foundation

public class LabelVieModel {
    public let text: String
    public let margins: Margin
    public let style: LabelComponent.Style

    public init(component: LabelComponent) {
        text = component.text
        margins = component.margins
        style = component.style
    }
}
