//
//  PillView.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 8/07/23.
//

import SwiftUI

public struct PillView: View {

    let component: PillComponent

    public init(component: PillComponent) {
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

struct PillView_Previews: PreviewProvider {
    static var previews: some View {
        PillView(
            component: .init(
                text: "123",
                icon: "vehicle",
                margins: .init()
            )
        )
    }
}
