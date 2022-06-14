//
//  ScrollViewPreferenceKey.swift
//  DesignCodeiOS15
//
//  Created by インヤキ on 6/14/22.
//

import SwiftUI

struct ScrollViewPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
