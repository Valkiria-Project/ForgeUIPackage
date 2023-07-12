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
