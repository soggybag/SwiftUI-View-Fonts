//
//  FontListView.swift
//  SwiftUI-View-Fonts
//
//  Created by mitchell hudson on 6/11/25.
//

import SwiftUI

import SwiftUI

struct FontListView: View {
    @State private var searchText = ""
  
  private let allFontFamilies = FontData.allFontFamilies
  
  var filteredFontFamilies: [String] {
    if searchText.isEmpty {
      return allFontFamilies
    } else {
      return allFontFamilies.filter { $0.localizedCaseInsensitiveContains(searchText) }
    }
  }

    var body: some View {
        NavigationView {
            List(filteredFontFamilies, id: \.self) { family in
                NavigationLink(destination: FontDetailView(familyName: family)) {
                    VStack(alignment: .leading) {
                      FontRowView(fontName: family)
//                        Text(family)
//                            .font(.custom(UIFont.fontNames(forFamilyName: family).first ?? "", size: 24))
//                        Text(family)
//                        .font(.body)
//                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Font Families")
            .searchable(text: $searchText, prompt: "Search Fonts")
        }
    }
}


#Preview {
    FontListView()
}
