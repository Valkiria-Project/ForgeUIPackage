//
//  TextFieldViewModel.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 27/06/23.
//

import Foundation
import SwiftUI

public class TextFieldViewModel: ObservableObject {
    public let hint: String
    public let regex: String
    public let keyboardType: UIKeyboardType
    public let margins: Margin
    public let icon: String?
    @Published public var inputText: String = ""
    @Published public var errorMessage: String?

    public init(component: TextFieldComponent) {
        hint = component.hint
        icon = component.icon
        regex = component.regex
        margins = component.margins

        switch component.keyboardType {
        case .numeric: keyboardType = .numberPad
        case .phone: keyboardType = .phonePad
        case .text: keyboardType = .namePhonePad
        case .email: keyboardType = .emailAddress
        }
    }
}
