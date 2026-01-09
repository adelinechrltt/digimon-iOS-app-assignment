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
    @State var viewModel: DigimonListViewModel

    init(modelContext: ModelContext) {
        _viewModel = State(
            wrappedValue: DigimonListViewModel(modelContext: modelContext)
        )
    }

    var body: some View {
        NavigationStack {
            VStack {
                SearchBar { text, category in
                    viewModel.onSearchBarUpdated(text: text, category: category)
                }
                if viewModel.displayItems.isEmpty {
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
                                ForEach(viewModel.displayItems) { item in
                                    switch item {
                                    case .digimon(let digimon):
                                        NavigationLink(
                                            destination:
                                                DigimonCard(
                                                    cardSize: .expanded,
                                                    digimon: digimon)) {
                                                        DigimonCard(cardSize: .minimized, digimon: digimon)
                                                    }
                                    case .metadata(let id, let name, let desc):
                                        MetadataCard(id: id, name: name, desc: desc)
                                    }
                                }
                            }
                        switch viewModel.selectedCategory {
                        case .id, .name:
                            if viewModel.page <= 1 {
                                Text("Scroll to view more entries")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                    .padding(20)
                                Spacer()
                            }
                        default:
                            Text("")
                        }
                    }
                    .padding(.horizontal, 10)
                }
            }
            .navigationTitle("Digimon")
            .simultaneousGesture(
                DragGesture().onEnded { value in
                    guard viewModel.selectedCategory == .id || viewModel.selectedCategory == .name else { return }
                    if value.translation.height < -50 {
                        viewModel.loadNextDigimonPage()
                    }
                }
            )
            .onChange(of: viewModel.networkMonitor.isConnected) { _, newValue in
                guard let isConnected = newValue else { return }
                if isConnected {
                    viewModel.loadNextDigimonPage()
                    viewModel.showOfflineAlert = false
                } else {
                    viewModel.showOfflineAlert = true
                }
            }
            .alert("No Internet Connection",
                   isPresented: $viewModel.showOfflineAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text("Please reconfigure your network settings.")
            }
            .onAppear {
                if let isConnected = viewModel.networkMonitor.isConnected {
                    if isConnected {
                        viewModel.loadNextDigimonPage()
                    } else {
                        viewModel.showOfflineAlert = true
                    }
                }
            }
        }
    }
}

#Preview {
    let container: ModelContainer = {
        let schema = Schema([Digimon.self])
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        do {
            return try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    return DigimonListView(modelContext: container.mainContext)
        .modelContainer(container)
}
