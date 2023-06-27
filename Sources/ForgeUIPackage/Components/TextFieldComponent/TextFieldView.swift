//
//  SwiftUIView.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 27/06/23.
//

import SwiftUI

public struct TextFieldView: View {

    public private(set) var viewModel: TextFieldViewModel
    @State public private(set) var inputText: String = ""

    public var body: some View {
        TextField(viewModel.hint, text: $inputText)
            .keyboardType(viewModel.keyboardType)
            .padding(
                .init(
                    top: viewModel.margin.top,
                    leading: viewModel.margin.left,
                    bottom: viewModel.margin.bottom,
                    trailing: viewModel.margin.right
                )
            )
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
