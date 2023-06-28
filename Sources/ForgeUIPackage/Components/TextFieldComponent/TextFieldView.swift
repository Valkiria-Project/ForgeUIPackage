//
//  TextFieldView.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 27/06/23.
//

import SwiftUI

public struct TextFieldView: View {

    public private(set) var viewModel: TextFieldViewModel
    @State public private(set) var inputText: String = ""
    @State public private(set) var errorMessage: String? = "Error Message"

    public var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                TextField("", text: $inputText)
                    .keyboardType(viewModel.keyboardType)
                    .frame(height: 40)
                    .border(errorMessage != nil ? Color.red : Color.gray, width: 2)
                if let errorMessage {
                    Text(errorMessage)
                        .foregroundColor(Color.red)
                        .padding([.leading])
                }
            }

            HStack {
                ZStack {
                    Text(viewModel.hint)
                        .padding([.leading], 10.0)
                        .padding([.bottom], errorMessage != nil ? 68 : 42)
                        .layoutPriority(1)
                }
                .padding([.leading], 2.0)
                Spacer()
            }
        }
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
