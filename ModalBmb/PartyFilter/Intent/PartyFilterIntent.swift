//
//  PartyFilterIntent.swift
//  ModalBmb
//
//  Created by Elio Fernandez on 23/04/2024.
//

import Foundation

enum PartyFilterIntent: MVIIntent {
    case toggleSelection(tag: Tag)
    case clearSelection
}
