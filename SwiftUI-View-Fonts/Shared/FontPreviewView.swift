//
//  FontPreviewView.swift
//  SwiftUI-View-Fonts
//
//  Created by mitchell hudson on 6/11/25.
//

import SwiftUI

import SwiftUI

struct FontPreviewView: View {
    let fontName: String

    @State private var previewSize: Double = 24.0
    @State private var sampleText: String = "The quick brown fox jumps over the lazy dog"

    var body: some View {
        VStack(spacing: 20) {
            // Preview area
            ScrollView {
                Text(sampleText)
                    .font(.custom(fontName, size: CGFloat(previewSize)))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(8)
            }

            // Font name display
            Text(fontName)
                .font(.caption)
                .foregroundColor(.secondary)

            // Text input field
            TextField("Enter sample text", text: $sampleText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            // Size slider
            HStack {
                Text("Size")
                Slider(value: $previewSize, in: 12...100)
                Text(String(format: "%.0f", previewSize))
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
        .navigationTitle("Font Preview")
    }
}



#Preview {
  FontPreviewView(fontName: "Helvetic Neue")
}
