//
//  ButtonView.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 27/06/23.
//

import SwiftUI

public struct ButtonView: View {

    public private(set) var viewModel: ButtonViewModel

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
        .style(viewModel.style)
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

struct QuietIconButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
            viewModel: .init(
                component: try! .quietIconOnlyButtonExample()
            )
        )
    }
}

struct QuietTextButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
            viewModel: .init(
                component: try! .quietTextOnlyButtonExample()
            )
        )
    }
}

struct QuietTextAndIconButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
            viewModel: .init(
                component: try! .quietTextAndIconButtonExample()
            )
        )
    }
}

struct LoudIconButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
            viewModel: .init(
                component: try! .loudIconOnlyButtonExample()
            )
        )
    }
}

struct LoudTextButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
            viewModel: .init(
                component: try! .loudTextOnlyButtonExample()
            )
        )
    }
}

struct LoudTextAndIconButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
            viewModel: .init(
                component: try! .loudTextAndIconButtonExample()
            )
        )
    }
}

struct SecondaryIconButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
            viewModel: .init(
                component: try! .secondaryIconOnlyButtonExample()
            )
        )
    }
}

struct SecondaryTextButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
            viewModel: .init(
                component: try! .secondaryTextOnlyButtonExample()
            )
        )
    }
}

struct SecondaryTextAndIconButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
            viewModel: .init(
                component: try! .secondaryTextAndIconButtonExample()
            )
        )
    }
}

extension Button {
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
