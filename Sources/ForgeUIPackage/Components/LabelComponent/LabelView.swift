//
//  LabelView.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 26/06/23.
//

import SwiftUI

public struct LabelView: View {

    public private(set) var viewModel: LabelVieModel

    public var body: some View {
        Text(viewModel.text)
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

struct TitleLabelView_Previews: PreviewProvider {
    static var previews: some View {
        LabelView(
            viewModel: .init(
                component: try! .titleExample()
            )
        )
    }
}

struct HeadingLabelView_Previews: PreviewProvider {
    static var previews: some View {
        LabelView(
            viewModel: .init(
                component: try! .headingExample()
            )
        )
    }
}

struct BodyLabelView_Previews: PreviewProvider {
    static var previews: some View {
        LabelView(
            viewModel: .init(
                component: try! .bodyExample()
            )
        )
    }
}

extension Text {
    func style(_ style: LabelStyle) -> some View {
        switch style {
        case .body:
            return self
                .font(.system(size: 14))
                .font(.body)
        case .title:
            return self
                .font(.system(size: 36))
                .font(.title)
        case .heading:
            return self
                .font(.system(size: 24))
                .font(.headline)
        }
    }
}
