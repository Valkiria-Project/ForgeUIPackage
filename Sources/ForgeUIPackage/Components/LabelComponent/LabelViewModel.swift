//
//  LabelVieModel.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 26/06/23.
//

import Foundation

public class LabelVieModel {
    let text: String
    let margins: Margin
    let style: LabelStyle

    public init(component: LabelComponent) {
        text = component.text
        margins = component.margins
        style = component.style
    }
}
