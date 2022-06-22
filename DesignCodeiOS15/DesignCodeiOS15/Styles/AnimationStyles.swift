//
//  AnimationStyles.swift
//  DesignCodeiOS15
//
//  Created by インヤキ on 6/22/22.
//

import SwiftUI

extension Animation {
    static let openCardSpring = Animation.spring(
        response: 0.5,
        dampingFraction: 0.7
    )
    static let closeCardSpring = Animation.spring(
        response: 0.6,
        dampingFraction: 0.9
    )
}
