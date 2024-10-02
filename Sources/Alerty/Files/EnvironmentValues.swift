//
//  EnvironmentValues.swift
//  Alerty
//
//  Created by Alpay Calalli on 02.10.24.
//

import SwiftUI

public extension EnvironmentValues {
    @Entry var insertionStyle: AnyTransition = .push(from: .bottom)
    @Entry var removalStyle: AnyTransition = .opacity
    
    @Entry var imageStyle: AnyShapeStyle = AnyShapeStyle(.background)
}

public extension View {
    func insertionStyle(_ style: AnyTransition) -> some View {
        environment(\.insertionStyle, style)
    }
    
    func removalStyle(_ style: AnyTransition) -> some View {
        environment(\.removalStyle, style)
    }
    
    func imageStyle(_ style: any ShapeStyle) -> some View {
        environment(\.imageStyle, AnyShapeStyle(style))
    }
}
