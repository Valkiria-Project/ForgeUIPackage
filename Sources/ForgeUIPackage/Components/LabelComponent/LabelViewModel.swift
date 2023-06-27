//
//  LabelVieModel.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 26/06/23.
//

import Foundation

public class LabelVieModel {
    let text: String
    let margin: Margin
    let style: LabelStyle

    public init(component: LabelComponent) {
        text = component.text
        margin = component.margin
        style = component.style
    }
}
