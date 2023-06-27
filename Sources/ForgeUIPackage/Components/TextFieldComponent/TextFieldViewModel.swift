//
//  TextFieldViewModel.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 27/06/23.
//

import Foundation
import SwiftUI

public class TextFieldViewModel {

    let hint: String
    let regex: String
    let keyboardType: UIKeyboardType
    let margin: Margin

    public init(component: TextFieldComponent) {
        hint = component.hint
        regex = component.regex
        margin = component.margin

        switch component.keyboardType {
        case .numeric: keyboardType = .numberPad
        case .phone: keyboardType = .phonePad
        case .text: keyboardType = .namePhonePad
        case .email: keyboardType = .emailAddress
        }
    }
}
