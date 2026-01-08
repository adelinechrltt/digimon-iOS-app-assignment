//
//  ContentView.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 06/01/26.
//

import SwiftUI

struct DigimonListView: View {
    @State private var digimons: [DigimonCard] = []
    @State private var page = 0
    @State private var isLoading = false

    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    private let pageSize = 8

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(Array(digimons.enumerated()), id: \.offset) { index, card in
                        NavigationLink {
                            DigimonCard(cardSize: .expanded)
                        } label: {
                            card
                        }
                    }
                }
                .padding(.horizontal, 10)
                if self.page <= 2 {
                    Text("Scroll to view more entries")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .padding(20)
                }
            }
            .navigationTitle("Digimon")
            .simultaneousGesture(
                DragGesture().onEnded { value in
                    if value.translation.height < -50 {
                        loadNextPage()
                    }
                }
            )
            .onAppear {
                if digimons.isEmpty { loadNextPage() }
            }
        }
    }

    private func loadNextPage() {
        guard !isLoading else { return }
        isLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            let newCards = (0..<pageSize).map { _ in DigimonCard(cardSize: .minimized) }

            self.digimons.append(contentsOf: newCards)
            self.page += 1
            self.isLoading = false
        }
    }
}

#Preview {
    DigimonListView()
}
