//
//  FontData.swift
//  SwiftUI-View-Fonts
//
//  Created by mitchell hudson on 6/11/25.
//

import UIKit

struct FontData {
    static let allFontFamilies: [String] = UIFont.familyNames.sorted()

    static func fonts(for family: String) -> [String] {
        UIFont.fontNames(forFamilyName: family).sorted()
    }
}

