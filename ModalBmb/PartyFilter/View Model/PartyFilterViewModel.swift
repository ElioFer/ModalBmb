//
//  PartyFilterViewModel.swift
//  ModalBmb
//
//  Created by Elio Fernandez on 23/04/2024.
//

import Foundation
import SwiftUI

class PartyFilterViewModel: MVIBaseViewModel {
    typealias Intent = PartyFilterIntent
    typealias ViewState = PartyFilterState
    
    @Published var tags: [Tag]
    @Published var isClearButtonVisible = false
    
    @Published var state: PartyFilterState
    
    func onIntent(_ intent: PartyFilterIntent) {
        switch intent {
        case .toggleSelection(let tag):
            if let index = tags.firstIndex(of: tag) {
                tags[index].isSelected.toggle()
                isClearButtonVisible = tags.contains(where: { $0.isSelected })
            }
        case .clearSelection:
            tags.indices.forEach { index in
                tags[index].isSelected = false
            }
            isClearButtonVisible = false
        }
    }
    
    init(state: [Tag]) {
        self.tags = []
        self.state = PartyFilterState(initialState: .selected)
        self.tags = state
    }
}
