//
//  ButtonView.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 27/06/23.
//

import SwiftUI

public struct ButtonView: View {

    private var viewModel: ButtonViewModel

    public init(viewModel: ButtonViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        Button(action: viewModel.buttonAction) {
            HStack {
                if let icon = viewModel.icon {
                    Image(systemName: icon)
                }
                if let label = viewModel.label {
                    Text(label)
                }
            }
            .frame(maxWidth: viewModel.size == ButtonComponent.Size.fullWidth ? .infinity : nil)
        }
    }
}

struct QuietTextAndIconButtonView_Previews: PreviewProvider {
    static var previews: some View {
        let component: ButtonComponent = try! .quietTextAndIconButtonExample()
        let viewModel = ButtonViewModel(component: component) {
            print("Worked with action \($0)")
        }
        ButtonView(viewModel: viewModel)
            .style(.quiet)
    }
}

struct LoudTextAndIconButtonView_Previews: PreviewProvider {
    static var previews: some View {
        let component: ButtonComponent = try! .loudTextAndIconButtonExample()
        let viewModel = ButtonViewModel(component: component) {
            print("Worked with action \($0)")
        }
        ButtonView(viewModel: viewModel)
            .style(.loud)
    }
}

struct SecondaryTextAndIconButtonView_Previews: PreviewProvider {
    static var previews: some View {
        let component: ButtonComponent = try! .secondaryTextAndIconButtonExample()
        let viewModel = ButtonViewModel(component: component) {
            print("Worked with action \($0)")
        }
        ButtonView(viewModel: viewModel)
            .style(.secondary)
    }
}

extension ButtonView {
    func style(_ style: ButtonComponent.Style) -> some View {
        switch style {
        case .loud:
            return self
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.black)
                .overlay(
                    RoundedRectangle(cornerRadius: .infinity)
                        .stroke(Color.blue, lineWidth: 2)
                )
                .cornerRadius(25)
        case .quiet:
            return self
                .padding()
                .background(Color.clear)
                .foregroundColor(Color.blue)
                .overlay(
                    RoundedRectangle(cornerRadius: .infinity)
                        .stroke(Color.red, lineWidth: 2)
                )
                .cornerRadius(25)
        case .secondary:
            return self
                .padding()
                .background(Color.black)
                .foregroundColor(Color.gray)
                .overlay(
                    RoundedRectangle(cornerRadius: .infinity)
                        .stroke(Color.gray, lineWidth: 2)
                )
                .cornerRadius(25)
        case .transparent:
            return self
                .padding()
                .background(Color.clear)
                .foregroundColor(Color.blue)
                .overlay(
                    RoundedRectangle(cornerRadius: .infinity)
                        .stroke(Color.red, lineWidth: 2)
                )
                .cornerRadius(25)
        }
    }
}
