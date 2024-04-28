//
//  PartyFilterState.swift
//  ModalBmb
//
//  Created by Elio Fernandez on 23/04/2024.
//

import Foundation

struct Tag: Identifiable, Equatable {
    let id = UUID()
    let name: String
    var isSelected = false
    
    init(name: String, isSelected: Bool = false) {
        self.name = name
        self.isSelected = isSelected
    }
}

enum PartyFilterState: MVIViewState {
    case selected
    case deselected
    case clear
    
    init(initialState: PartyFilterState) {
        self = initialState
    }
}
