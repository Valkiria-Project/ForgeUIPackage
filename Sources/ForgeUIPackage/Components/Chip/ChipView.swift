//
//  PillView.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 8/07/23.
//

import SwiftUI

public struct ChipView: View {

    let component: ChipComponent

    public init(component: ChipComponent) {
        self.component = component
    }

    public var body: some View {
        HStack(spacing: 22) {
            Image(component.icon)
                .foregroundColor(.black)
                .frame(width: 43, height: 34)
            Text(component.text)
                .font(.system(size: 16, weight: .bold))
        }
    }
}

struct ChipView_Previews: PreviewProvider {
    static var previews: some View {
        ChipView(
            component: .init(
                text: "123",
                icon: "vehicle",
                textStyle: .body1,
                margins: .init()
            )
        )
    }
}
