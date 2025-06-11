//
//  FontDetailView.swift
//  SwiftUI-View-Fonts
//
//  Created by mitchell hudson on 6/11/25.
//

import SwiftUI

struct FontDetailView: View {
    let familyName: String
    var fontNames: [String] {
        UIFont.fontNames(forFamilyName: familyName).sorted()
    }

    var body: some View {
        List(fontNames, id: \.self) { fontName in
            NavigationLink(destination: FontPreviewView(fontName: fontName)) {
                VStack(alignment: .leading) {
                  FontRowView(fontName: fontName)
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle(familyName)
    }
}



#Preview {
  FontDetailView(familyName: "Helvetica neue")
}
