//
//  ContentView.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 06/01/26.
//

import SwiftUI
import SwiftData

struct DigimonListView: View {
    
    @Environment(\.modelContext) private var modelContext
    @State var vm: DigimonListViewModel
    
    init(modelContext: ModelContext) {
        _vm = State(
            wrappedValue: DigimonListViewModel(modelContext: modelContext)
        )
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchBar { text, category in
                    vm.onSearchBarUpdated(text: text, category: category)
                }
                if(vm.displayItems.isEmpty){
                    Spacer()
                    Text("No entries to display!")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Spacer()
                } else {
                    ScrollView {
                        LazyVGrid(
                            columns:
                                [
                                    GridItem(.flexible()),
                                    GridItem(.flexible())
                                ],
                            spacing: 10) {
                                ForEach(vm.displayItems) { item in
                                    switch item {
                                    case .digimon(let digimon):
                                        NavigationLink(destination: DigimonCard(cardSize: .expanded, digimon: digimon)) {
                                            DigimonCard(cardSize: .minimized, digimon: digimon)
                                        }
                                    case .metadata(let id, let name, let desc):
                                        MetadataCard(id: id, name: name, desc: desc)
                                    }
                                }
                            }
                    }
                    .padding(.horizontal, 10)
                    if vm.page <= 1 {
                        Text("Scroll to view more entries")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .padding(20)
                        Spacer()
                    }
                }
            }
            .navigationTitle("Digimon")
            .simultaneousGesture(
                DragGesture().onEnded { value in
                    guard vm.selectedCategory == .id || vm.selectedCategory == .name else { return }
                    if value.translation.height < -50 {
                        vm.loadNextPage()
                    }
                }
            )
            .onAppear {
                vm.loadNextPage()
            }
        }
    }
}

#Preview {
    let container = try! ModelContainer(
        for: Digimon.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )
    
    DigimonListView(modelContext: container.mainContext)
        .modelContainer(container)
}
