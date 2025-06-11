//
//  FontRowView.swift
//  SwiftUI-View-Fonts
//
//  Created by mitchell hudson on 6/11/25.
//

import SwiftUI

import SwiftUI

struct FontRowView: View {
    let fontName: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("The quick brown fox jumps")
                .font(.custom(fontName, size: 20))
            Text(fontName)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 4)
    }
}


#Preview {
  FontRowView(fontName: "Helvetica Neue")
}
