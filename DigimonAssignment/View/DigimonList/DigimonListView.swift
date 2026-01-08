//
//  ContentView.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 06/01/26.
//

import SwiftUI

struct DigimonListView: View {
    
    @State var vm: DigimonListViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(
                    columns:
                        [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ],
                    spacing: 10) {
                        ForEach(Array(vm.digimons.enumerated()), id: \.offset) { index, digimon in
                        NavigationLink {
                            DigimonCard(
                                cardSize: .expanded,
                                digimon: digimon)
                        } label: {
                            DigimonCard(
                                cardSize: .minimized,
                                digimon: digimon)
                        }
                    }
                }
                .padding(.horizontal, 10)
                if vm.page <= 1 {
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
                        vm.loadNextPage()
                    }
                }
            )
            .onAppear {
                if vm.digimons.isEmpty { vm.loadNextPage() }
            }
        }
    }
}

#Preview {
    DigimonListView(vm: DigimonListViewModel())
}
