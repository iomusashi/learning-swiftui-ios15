//
//  AnimatableFontStyles.swift
//  DesignCodeiOS15
//
//  Created by インヤキ on 6/14/22.
//

import SwiftUI

struct AnimatableFontModifier: AnimatableModifier {
    var size: Double
    var weight: Font.Weight
    var design: Font.Design
    
    var animatableData: Double {
        get { size }
        set { size = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .font(
                .system(
                    size: size,
                    weight: weight,
                    design: design
                )
            )
    }
}

extension View {
    func animatableFont(
        size: Double,
        weight: Font.Weight = .regular,
        design: Font.Design = .default
    ) -> some View {
        self.modifier(
            AnimatableFontModifier(
                size: size,
                weight: weight,
                design: design
            )
        )
    }
}
