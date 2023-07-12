//
//  TermsAndConditions.swift
//  
//
//  Created by Ricardo Grajales Duque on 9/07/23.
//

import Foundation

public class TermsAndConditionsComponent: Component {

    public init(margins: Component.Margin) {
        super.init(textStyle: .body1, margins: margins, type: .termsAndConditions)
    }

    public required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
