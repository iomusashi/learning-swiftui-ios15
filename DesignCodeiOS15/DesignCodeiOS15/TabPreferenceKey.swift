//
//  TabPreferencesKey.swift
//  DesignCodeiOS15
//
//  Created by インヤキ on 6/13/22.
//

import SwiftUI

struct TabPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
