//
//  BottomAlertModifier.swift
//  Alerty
//
//  Created by Alpay Calalli on 02.10.24.
//

import SwiftUI

struct BottomAlertModifier<Label: View>: ViewModifier {
    @Binding var isPresented: Bool
    let content: () -> Label
    let autoDismissInterval: TimeInterval
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .bottom) {
                if isPresented {
                    self.content()
                        .insertionStyle(.push(from: .bottom))
                        .removalStyle(.opacity)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + autoDismissInterval) {
                                withAnimation {
                                    isPresented = false
                                }
                            }
                            
                        }
                }
            }
    }
}

public extension View {
    func bottomAlert(
        isPresented: Binding<Bool>,
        autoDismissAfter interval: TimeInterval = 2.0,
        @ViewBuilder content: @escaping () -> some View
    ) -> some View {
        self.modifier(BottomAlertModifier(
            isPresented: isPresented,
            content: content,
            autoDismissInterval: interval
        ))
    }
}
