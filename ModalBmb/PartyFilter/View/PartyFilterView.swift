//
//  PartyFilterView.swift
//  ModalBmb
//
//  Created by Elio Fernandez on 23/04/2024.
//

import Foundation
import SwiftUI

struct PartyFilterView: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject var partyFilterVM: PartyFilterViewModel
    @Binding var searchText: String
    @Binding var text: String
    
    var body: some View {
        VStack {
            Capsule()
                .frame(width: 78.0, height: 4.0)
                .foregroundColor(Color.gray.opacity(0.4))
                .padding(.top, 18.0)
            
            cleanButton
            textFilterByParty
            searchBar
            tagsList
            
            filterbottomButton
                .padding(.bottom, 25)
                .padding(.top, 15)
                .padding(.horizontal, 40)
        }
    }
    
    var searchBar: some View {
        VStack {
            ZStack(alignment: .center) {
                Capsule()
                    .fill(Color.gray.opacity(0.11))
                    .frame(height: 40)
                    .padding(.horizontal, 30)
                
                HStack {
                    if text.isEmpty {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.leading, 16)
                    }
                    
                    TextField("¿Qué evento querés buscar?", text: $text)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.subheadline)
                        
                }
                .padding(.leading, 40)
            }
            .padding(.top, 8.0)
            .padding(.bottom, 6.0)
        }
    }
    
    var cleanButton: some View {
        HStack {
            if partyFilterVM.isClearButtonVisible {
                Button(action: {
                    partyFilterVM.onIntent(.clearSelection)
                }) {
                    HStack(spacing: 2) {
                        Image(systemName: "trash")
                        Text("Limpiar")
                    }
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .padding(.top, 10.0)
        .padding(.trailing, 30)
    }
    
    var textFilterByParty: some View {
        Text("Filtrar por fiesta:")
            .fontWeight(.heavy)
            .font(.title)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 30)
            .padding(.top, 2.0)
            .padding(.bottom, 2)
    }
    
    var tagsList: some View {
        ScrollView {
            LazyVStack(alignment: .center) {
                var width = CGFloat.zero
                var height = CGFloat.zero
                
                ZStack(alignment: .topLeading) {
                    ForEach(partyFilterVM.tags) { tag in
                        TagItemView(tag: tag, partyFilterVM: partyFilterVM)
                            .padding([.horizontal, .vertical], 4)
                            .alignmentGuide(.leading, computeValue: { d in
                                if (abs(width - d.width) > UIScreen.main.bounds.width) {
                                    width = 0
                                    height -= d.height
                                }
                                let result = width
                                if tag == partyFilterVM.tags.last {
                                    width = 0
                                } else {
                                    width -= d.width
                                }
                                return result
                            })
                            .alignmentGuide(.top, computeValue: { d in
                                let result = height
                                if tag == partyFilterVM.tags.last {
                                    height = 0
                                }
                                return result
                            })
                            .onTapGesture {
                                partyFilterVM.onIntent(.toggleSelection(tag: tag))
                            }
                    }
                }
            }
        }
    }
    
    var filterbottomButton: some View {
        Button(action: {
            //
        }) {
            Text("Aplicar filtro")
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.white)
                .padding(.horizontal, 2)
                .padding(.vertical, 18)
                .background(Color.black)
                .cornerRadius(30)
                .fontWeight(.black)
        }
    }
}
