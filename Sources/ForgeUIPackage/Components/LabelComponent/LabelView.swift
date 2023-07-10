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

//struct HTMLText: UIViewRepresentable {
//
//   let html: String
//
//   func makeUIView(context: UIViewRepresentableContext<Self>) -> UILabel {
//        let label = UILabel()
//        DispatchQueue.main.async {
//            let data = Data(self.html.utf8)
//            if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
//                label.attributedText = attributedString
//            }
//        }
//
//        return label
//    }
//
//    func updateUIView(_ uiView: UILabel, context: Context) {}
//}

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
    func style(_ style: LabelComponent.Style) -> some View {
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
