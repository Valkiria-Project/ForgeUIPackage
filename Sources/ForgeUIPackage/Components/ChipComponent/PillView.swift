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
            Text(component.text)
                .font(.system(size: 16, weight: .bold))
        }
        .frame(width: 156, height: 46)
    }
}

struct ChipView_Previews: PreviewProvider {
    static var previews: some View {
        ChipView(
            component: .init(
                text: "123",
                icon: "vehicle",
                margins: .init()
            )
        )
    }
}
