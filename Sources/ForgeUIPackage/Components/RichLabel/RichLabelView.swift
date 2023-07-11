//
//  RichLabelView.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 10/07/23.
//

import SwiftUI

public struct RichLabelView: View {

    private var viewModel: RichLabelViewModel

    public init(viewModel: RichLabelViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        HTMLText(html: viewModel.text)
            .fixedSize(horizontal: true, vertical: true)
    }
}

struct HTMLText: UIViewRepresentable {

    let html: String

    func makeUIView(context: UIViewRepresentableContext<Self>) -> UILabel {
        let label = UILabel()
        DispatchQueue.main.async {
            let data = Data(self.html.utf8)
            if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
                label.attributedText = attributedString
            }
        }

        return label
    }

    func updateUIView(_ uiView: UILabel, context: Context) {}
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        RichLabelView(
            viewModel: .init(
                component: .init(
                    text: "Title <b> bold text </b>",
                    style: .heading,
                    margins: .init()
                )
            )
        )
    }
}
