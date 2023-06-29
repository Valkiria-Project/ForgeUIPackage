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
        Button {
            // TODO: Define how to handle actions
        } label: {
            if let icon = viewModel.icon {
                Image(systemName: icon)
            }
            if let label = viewModel.label {
                Text(label)
            }
        }
    }
}

struct QuietIconButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
            viewModel: .init(
                component: try! .quietIconOnlyButtonExample()
            )
        )
        .style(.quiet)
    }
}

struct QuietTextButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
            viewModel: .init(
                component: try! .quietTextOnlyButtonExample()
            )
        )
        .style(.quiet)
    }
}

struct QuietTextAndIconButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
            viewModel: .init(
                component: try! .quietTextAndIconButtonExample()
            )
        )
        .style(.quiet)
    }
}

struct LoudIconButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
            viewModel: .init(
                component: try! .loudIconOnlyButtonExample()
            )
        )
        .style(.loud)
    }
}

struct LoudTextButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
            viewModel: .init(
                component: try! .loudTextOnlyButtonExample()
            )
        )
        .style(.loud)
    }
}

struct LoudTextAndIconButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
            viewModel: .init(
                component: try! .loudTextAndIconButtonExample()
            )
        ).style(.loud)
    }
}

struct SecondaryIconButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
            viewModel: .init(
                component: try! .secondaryIconOnlyButtonExample()
            )
        )
        .style(.secondary)
    }
}

struct SecondaryTextButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
            viewModel: .init(
                component: try! .secondaryTextOnlyButtonExample()
            )
        )
        .style(.secondary)
    }
}

struct SecondaryTextAndIconButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
            viewModel: .init(
                component: try! .secondaryTextAndIconButtonExample()
            )
        )
        .style(.secondary)
    }
}

fileprivate extension ButtonView {
    func style(_ style: ButtonStyle) -> some View {
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
        }
    }
}
