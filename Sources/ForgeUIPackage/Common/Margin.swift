//
//  Margin.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 26/06/23.
//

import Foundation

extension Component {
    public struct Margin: Codable {
        public let top: CGFloat
        public let left: CGFloat
        public let right: CGFloat
        public let bottom: CGFloat

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
}

