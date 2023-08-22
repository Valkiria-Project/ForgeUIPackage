//
//  TermsAndConditions.swift
//  
//
//  Created by Ricardo Grajales Duque on 9/07/23.
//

import Foundation

public class TermsAndConditionsComponent: Component {

    public init(margins: Component.Margin, arrangement: Component.Arrangement) {
        super.init(id: .init(), textStyle: .body1, margins: margins, type: .termsAndConditions, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
}
