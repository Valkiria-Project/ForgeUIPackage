//
//  PasswordTextFieldViewModel.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 11/07/23.
//

import SwiftUI

public class PasswordTextFieldViewModel: ObservableObject {
    @Published public var inputText: String = "" {
        didSet {
            closure(identifier, inputText)
        }
    }
    @Published public var showError: Bool = false
    @Published public var isShowingPassword: Bool = false

    public let identifier: Component.Identifier?
    public let hint: String
    public let keyboardType: UIKeyboardType
    public let margins: Component.Margin
    public let icon: String?
    public var errorMessage: String?
    public var closure: (Component.Identifier?, String) -> Void

    public init(
        component: PasswordTextFieldComponent,
        inputClosure: @escaping (Component.Identifier?, String) -> Void
    ) {
        closure = inputClosure
        identifier = component.identifier
        hint = component.placeholder
        icon = component.icon
        margins = component.margins
        keyboardType = .emailAddress
    }

    func showPassword() {
        isShowingPassword = true
    }

    func hidePassword() {
        isShowingPassword = false
    }
}

