//
//  FontBrowserView.swift
//  SwiftUI-View-Fonts
//
//  Created by mitchell hudson on 6/11/25.
//

import SwiftUI

struct FontBrowserView: View {
    @Environment(\.horizontalSizeClass) var sizeClass

    @State private var selectedFamily: String?
    @State private var selectedFont: String?

    var body: some View {
        if sizeClass == .regular {
            // Landscape or large screen → 3-column layout
            NavigationSplitView {
                List(FontData.allFontFamilies, id: \.self, selection: $selectedFamily) { family in
                    Text(family)
                        .font(.custom(FontData.fonts(for: family).first ?? "", size: 18))
                }
                .navigationTitle("Font Families")
            } content: {
                if let family = selectedFamily {
                    let fonts = FontData.fonts(for: family)
                    List(fonts, id: \.self, selection: $selectedFont) { font in
                        FontRowView(fontName: font)
                    }
                    .navigationTitle(family)
                } else {
                    Text("Select a font family")
                        .foregroundColor(.gray)
                        .navigationTitle("Fonts")
                }
            } detail: {
                if let font = selectedFont {
                    FontPreviewView(fontName: font)
                } else {
                    Text("Select a font")
                        .foregroundColor(.gray)
                }
            }
        } else {
            // Portrait (or iPhone-like) → 2-column fallback
            NavigationSplitView {
                List(FontData.allFontFamilies, id: \.self, selection: $selectedFamily) { family in
                    Text(family)
                        .font(.custom(FontData.fonts(for: family).first ?? "", size: 18))
                }
                .navigationTitle("Font Families")
            } detail: {
                if let family = selectedFamily {
                    NavigationStack {
                        List(FontData.fonts(for: family), id: \.self) { font in
                            NavigationLink(destination: FontPreviewView(fontName: font)) {
                                FontRowView(fontName: font)
                            }
                        }
                        .navigationTitle(family)
                    }
                } else {
                    Text("Select a font family")
                        .foregroundColor(.gray)
                }
            }
        }
    }
}


#Preview {
  FontBrowserView()
}
