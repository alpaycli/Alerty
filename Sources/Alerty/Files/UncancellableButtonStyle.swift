//
//  UncancellableButtonStyle.swift
//  Alerty
//
//  Created by Alpay Calalli on 02.10.24.
//

import SwiftUI

struct PressingButtonStyle: ButtonStyle {
    @Environment(\.controlSize) var controlSize
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .scaleEffect(configuration.isPressed ? 0.90 : 1)
                .animation(.spring(), value: configuration.isPressed)
    }
}

extension ButtonStyle where Self == PressingButtonStyle {
    static var pressing: PressingButtonStyle {
        PressingButtonStyle()
    }
}
