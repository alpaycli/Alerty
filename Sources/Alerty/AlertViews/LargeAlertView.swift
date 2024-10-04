//
//  LargeAlertView.swift
//  Alerty
//
//  Created by Alpay Calalli on 02.10.24.
//

import SwiftUI

public struct LargeAlertView: View {
    
    // MARK: - Environment values
    
    @Environment(\.insertionStyle) var insertionStyle
    @Environment(\.removalStyle) var removalStyle
    @Environment(\.imageStyle) var imageStyle
    
    // MARK: - Properties
    
    let title: String?
    let image: Image?
    let role: AlertRole?
    
    let buttonTitle: String?
    let buttonAction: (() -> ())?
    
    // MARK: - init
    
    public init(
        title: String? = nil,
        buttonTitle: String? = nil,
        buttonAction: @escaping () -> Void = {}
    ) {
        self.title = title
        self.buttonTitle = buttonTitle
        self.buttonAction = buttonAction
        
        self.role = nil
        self.image = nil
    }
    
    // MARK: - Body
    
    public var body: some View {
        HStack {
            
            if let role {
                Image(systemName: role.filledName)
                    .foregroundStyle(role.color)
            }
            
            if let image {
                image
                    .foregroundStyle(imageStyle)
            }
            
            if let title {
                Text(title)
                    .foregroundStyle(.background)
            }
            
            Spacer()
            
            if let buttonTitle {
                Button(buttonTitle, action: buttonAction ?? {})
                    .foregroundStyle(.gray)
                    .fontWeight(.bold)
            }
        }
        .padding(.horizontal).padding(.vertical, 13)
        .background(.primary, in: .rect(cornerRadius: 10))
        .padding(.horizontal, 10)
        .transition(.asymmetric(insertion: insertionStyle, removal: removalStyle))
    }
}

public extension LargeAlertView {
    init(
        title: String? = nil,
        systemImage: String,
        buttonTitle: String? = nil,
        buttonAction: @escaping () -> Void = {}
    ) {
        self.title = title
        self.image = .init(systemName: systemImage)
        self.buttonTitle = buttonTitle
        self.buttonAction = buttonAction
        
        self.role = nil
    }
    
    init(
        title: String? = nil,
        image: String,
        buttonTitle: String? = nil,
        buttonAction: @escaping () -> Void = {}
    ) {
        self.title = title
        self.image = .init(image)
        self.buttonTitle = buttonTitle
        self.buttonAction = buttonAction
        
        self.role = nil
    }
    
    init(
        title: String? = nil,
        role: AlertRole,
        buttonTitle: String? = nil,
        buttonAction: @escaping () -> Void = {}
    ) {
        self.title = title
        self.role = role
        self.buttonTitle = buttonTitle
        self.buttonAction = buttonAction
        
        self.image = nil
    }
}

#Preview {
    LargeAlertView(title: "Error sending verification code, please try again later.", buttonAction: {})
}
