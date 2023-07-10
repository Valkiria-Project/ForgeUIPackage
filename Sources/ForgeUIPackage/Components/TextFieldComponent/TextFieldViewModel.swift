//
//  TextFieldViewModel.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 27/06/23.
//

import Foundation
import SwiftUI

public class TextFieldViewModel: ObservableObject {

    @Published public var inputText: String = "" {
        didSet {
            closure(inputText)
        }
    }
    @Published public var showError: Bool = false

    public let identifier: Component.Identifier?
    public let hint: String
    public let keyboardType: UIKeyboardType
    public let margins: Margin
    public let icon: String?
    public var errorMessage: String?
    public var closure: (String) -> Void

    let textValidator: TextValidator

    public init(
        component: TextFieldComponent,
        inputClosure: @escaping (String) -> Void
    ) {
        closure = inputClosure
        identifier = component.identifier
        hint = component.hint
        icon = component.icon
        margins = component.margins
        textValidator = TextValidator(component.validations)

        switch component.keyboardType {
        case .numeric: keyboardType = .numberPad
        case .phone: keyboardType = .phonePad
        case .text: keyboardType = .namePhonePad
        case .email: keyboardType = .emailAddress
        case .password: keyboardType = .emailAddress
        }
    }

    public func validate() {
        errorMessage = textValidator.validate(text: inputText)
    }
}
