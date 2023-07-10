//
//  TextFieldView.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 27/06/23.
//

import SwiftUI

public struct TextFieldView: View {

    @ObservedObject private var viewModel: TextFieldViewModel

    public init(viewModel: TextFieldViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        HStack {
            if let icon = viewModel.icon {
                Image(icon)
                    .resizable()
                    .frame(width: 32, height: 32)
            }
            VStack(alignment: .leading) {
                if viewModel.icon == nil {
                    Text(viewModel.hint)
                }
                if viewModel.identifier == .passwordTextField {
                    SecureField(viewModel.icon == nil ? "" : viewModel.hint, text: $viewModel.inputText)
                        .keyboardType(viewModel.keyboardType)
                        .frame(height: 40)
                        .border(viewModel.showError ? Color.red : Color.black)
                } else {
                    TextField(viewModel.icon == nil ? "" : viewModel.hint, text: $viewModel.inputText)
                        .keyboardType(viewModel.keyboardType)
                        .frame(height: 40)
                        .border(viewModel.showError ? Color.red : Color.black)
                }
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(Color.red)
                        .padding([.leading])
                }
            }
        }
    }
}

struct EmailTextField_Previews: PreviewProvider {
    static var previews: some View {
        let component: TextFieldComponent = try! .numericTextField()
        let viewModel = TextFieldViewModel(component: component) { newValue in
            print("newValue: \(newValue)")
        }
        TextFieldView(viewModel: viewModel)
    }
}

struct NameTextField_Previews: PreviewProvider {
    static var previews: some View {
        let component: TextFieldComponent = try! .nameTextField()
        let viewModel = TextFieldViewModel(component: component) { newValue in
            print("newValue: \(newValue)")
        }
        TextFieldView(viewModel: viewModel)
    }
}

struct NumericTextField_Previews: PreviewProvider {
    static var previews: some View {
        let component: TextFieldComponent = try! .numericTextField()
        let viewModel = TextFieldViewModel(component: component) { newValue in
            print("newValue: \(newValue)")
        }
        TextFieldView(viewModel: viewModel)
    }
}

struct PhoneTextField_Previews: PreviewProvider {
    static var previews: some View {
        let component: TextFieldComponent = try! .phoneTextField()
        let viewModel = TextFieldViewModel(component: component) { newValue in
            print("newValue: \(newValue)")
        }
        TextFieldView(viewModel: viewModel)
    }
}
