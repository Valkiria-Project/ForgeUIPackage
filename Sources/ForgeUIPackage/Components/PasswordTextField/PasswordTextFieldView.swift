//
//  PasswordTextFieldView.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 11/07/23.
//

import SwiftUI

public struct PasswordTextFieldView: View {

    @ObservedObject var viewModel: PasswordTextFieldViewModel

    public init(viewModel: PasswordTextFieldViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack {
            HStack {
                if let icon = viewModel.icon {
                    Image(icon)
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                HStack {
                    SecureField(
                        viewModel.icon == nil ? "" : viewModel.hint,
                        text: $viewModel.inputText
                    )
                    .keyboardType(viewModel.keyboardType)

                    Button {

                    } label: {
                        Image(systemName: "eye")
                    }
                    .padding(.trailing)
                }
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

struct PasswordTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        let component: PasswordTextFieldComponent = try! .example()
        let viewModel = PasswordTextFieldViewModel( component: component) {
            print("newValue: \($1)")
        }
        PasswordTextFieldView(
            viewModel: viewModel
        )
    }
}
