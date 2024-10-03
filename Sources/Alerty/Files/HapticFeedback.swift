//
//  HapticFeedback.swift
//  Alerty
//
//  Created by Alpay Calalli on 03.10.24.
//

import SwiftUI

struct HapticFeedback<T: Equatable>: ViewModifier {
    
    let trigger: T
    
    func body(content: Content) -> some View {
        if #available(iOS 17, *) {
            content
                .sensoryFeedback(.impact, trigger: trigger)
        } else {
            content
        }
    }
}

extension View {
    func hapticFeedback<T: Equatable>(trigger: T) -> some View where T : Equatable {
        modifier(HapticFeedback(trigger: trigger))
        
    }
}
