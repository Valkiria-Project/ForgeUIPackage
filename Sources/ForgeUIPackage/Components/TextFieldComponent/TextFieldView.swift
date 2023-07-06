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
                TextField(viewModel.icon == nil ? "" : viewModel.hint, text: $viewModel.inputText)
                    .keyboardType(viewModel.keyboardType)
                    .frame(height: 40)
                    .border(viewModel.showError ? Color.red : Color.black)
                if viewModel.showError {
                    Text(viewModel.errorMessage)
                        .foregroundColor(Color.red)
                        .padding([.leading])
                }
            }
        }
    }
}

struct EmailTextField_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(
            viewModel: .init(
                component: try! .emailTextField()
            )
        )
    }
}

struct NameTextField_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(
            viewModel: .init(
                component: try! .nameTextField()
            )
        )
    }
}

struct NumericTextField_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(
            viewModel: .init(
                component: try! .numericTextField()
            )
        )
    }
}

struct PhoneTextField_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(
            viewModel: .init(
                component: try! .phoneTextField()
            )
        )
    }
}
