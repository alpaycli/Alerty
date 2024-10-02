//
//  SmallAlertView.swift
//  Alerty
//
//  Created by Alpay Calalli on 02.10.24.
//

import SwiftUI

public struct SmallAlertView: View {
    
    // MARK: - Environment values
    
    @Environment(\.insertionStyle) var insertionStyle
    @Environment(\.removalStyle) var removalStyle
    
    // MARK: - Properties
    
    let image: Image?
    let role: AlertRole?
    
    let title: String
    let action: (() -> ())?
    
    // MARK: - init
    
    public init(
        title: String,
        onTapAction: @escaping () -> Void = {}
    ) {
        self.title = title
        self.action = onTapAction
        
        self.role = nil
        self.image = nil
    }
    
    // MARK: - Body
    
    public var body: some View {
        Button(action: action ?? {})  {
            HStack {
                if let image {
                    image
                }
                if let role {
                    Image(systemName: role.name)
                }
                Text("Issue created")
                    .lineLimit(2)
                    
            }
            .padding(.horizontal).padding(.vertical, 13)
            .frame(width: 180)
            .background(.thinMaterial, in: .capsule(style: .continuous))
            .shadow(radius: 1)
            .font(.body)
        }
        .buttonStyle(.pressing)
        .transition(.asymmetric(insertion: insertionStyle, removal: removalStyle))
    }
}

public extension SmallAlertView {
    init(
        title: String,
        systemImage: String,
        onTapAction: @escaping () -> Void = {}
    ) {
        self.title = title
        self.action = onTapAction
        self.image = .init(systemName: systemImage)
        
        self.role = nil
    }
    
    init(
        title: String,
        image: String,
        onTapAction: @escaping () -> Void = {}
    ) {
        self.title = title
        self.action = onTapAction
        self.image = .init(image)
        
        self.role = nil
    }
    
    init(
        title: String,
        role: AlertRole,
        onTapAction: @escaping () -> Void = {}
    ) {
        self.title = title
        self.action = onTapAction
        self.role = role
        
        self.image = nil
    }
}
