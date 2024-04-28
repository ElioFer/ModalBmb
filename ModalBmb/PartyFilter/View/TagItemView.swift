//
//  TagItemView.swift
//  ModalBmb
//
//  Created by Elio Fernandez on 23/04/2024.
//

import Foundation
import SwiftUI

struct TagItemView: View {
    let tag: Tag
    @ObservedObject var partyFilterVM: PartyFilterViewModel
    
    var body: some View {
        Text(tag.name)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .font(.system(size: tag.isSelected ? 12 : 12, weight: tag.isSelected ? .bold : .regular))
            .foregroundColor(tag.isSelected ? .white : .black)
            .background(tag.isSelected ? Color.black : Color.white)
            .cornerRadius(6)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.black, lineWidth: 1)
            )
    }
}

