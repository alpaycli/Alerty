//
//  AlertRole.swift
//  Alerty
//
//  Created by Alpay Calalli on 02.10.24.
//

import SwiftUI

public enum AlertRole {
    case checkmark
    case plus
    case minus
    case warning
}

extension AlertRole {
    var name: String {
        switch self {
        case .checkmark:
            "checkmark"
        case .plus:
            "plus"
        case .minus:
            "minus"
        case .warning:
            "exclamationmark"
        }
    }
    
    var filledName: String {
        switch self {
        case .checkmark:
            "checkmark.circle.fill"
        case .plus:
            "plus.circle.fill"
        case .minus:
            "minus.circle.fill"
        case .warning:
            "exclamationmark.triangle.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .checkmark: .green
        case .plus: .green
        case .minus: .red
        case .warning: .yellow
        }
    }
}
