//
//  LabelView.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 26/06/23.
//

import SwiftUI

public struct LabelView: View {

    private var viewModel: LabelVieModel

    public init(viewModel: LabelVieModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        Text(viewModel.text)
    }
}

struct TitleLabelView_Previews: PreviewProvider {
    static var previews: some View {
        LabelView(
            viewModel: .init(
                component: try! .titleExample()
            )
        )
        .style(.title)
    }
}

struct HeadingLabelView_Previews: PreviewProvider {
    static var previews: some View {
        LabelView(
            viewModel: .init(
                component: try! .headingExample()
            )
        )
        .style(.heading)
    }
}

struct BodyLabelView_Previews: PreviewProvider {
    static var previews: some View {
        LabelView(
            viewModel: .init(
                component: try! .bodyExample()
            )
        )
        .style(.body)
    }
}

fileprivate extension LabelView {
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
