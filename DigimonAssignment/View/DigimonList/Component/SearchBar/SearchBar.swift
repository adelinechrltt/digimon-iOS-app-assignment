//
//  Searchbar.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    @State private var searchText: String = ""
    @State private var selectedCategory: SearchCategory = .id
    var onSearch: ((String, SearchCategory) -> Void)?

    var body: some View {
        HStack(spacing: 10) {
            Menu {
                ForEach(
                    SearchCategory
                        .allCases
                        .reversed()
                ) { category in
                    Button(category.rawValue) {
                        selectedCategory = category
                    }
                }
            } label: {
                HStack {
                    Text(selectedCategory.rawValue)
                        .foregroundColor(.primary)
                        .font(.subheadline)
                    Image(systemName: "chevron.down")
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            }

            TextField(renderSearchText(), text: $searchText)
                .textFieldStyle(.roundedBorder)
                .font(.subheadline)

            Button(action: {
                onSearch?(searchText, selectedCategory)
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
        .padding(.horizontal)
        .padding(.top, 5)
        .onChange(of: selectedCategory) { _, newValue in
            onSearch?(searchText, newValue)
        }
    }

    private func renderSearchText() -> String {
        switch self.selectedCategory {
        case .id:
            return "Search Digimon by \(selectedCategory.rawValue)..."
        case .name:
            return "Search Digimon by \(selectedCategory.rawValue)..."
        default:
            return "Search for \(selectedCategory.rawValue)..."
        }
    }
}

#Preview {
    SearchBar { text, category in
        print("Searching for \(text) in category \(category.rawValue)")
    }
}
