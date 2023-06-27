//
//  Margin.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 26/06/23.
//

import Foundation

public struct Margin: Codable {
    let top: CGFloat
    let left: CGFloat
    let right: CGFloat
    let bottom: CGFloat

    init() {
        top = 0
        left = 0
        right = 0
        bottom = 0
    }

    public init(top: CGFloat, left: CGFloat, right: CGFloat, bottom: CGFloat) {
        self.top = top
        self.left = left
        self.right = right
        self.bottom = bottom
    }
}
