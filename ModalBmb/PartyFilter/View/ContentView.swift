//
//  ContentView.swift
//  ModalBmb
//
//  Created by Elio Fernandez on 23/04/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var partyFilterVM: PartyFilterViewModel
    
    @State private var showModal = false
    @State private var searchText = ""
    @State private var text = ""
    
    init() {
        let tags: [Tag] = [
            Tag(name: "BRESH"), Tag(name: "COMPASS BERLIN"), Tag(name: "QUEMA QUEMA"),
            Tag(name: "COMPASS BERLIN"), Tag(name: "BRESH"), Tag(name: "QUEMA QUEMA"),
            Tag(name: "BRESH"), Tag(name: "COMPASS BERLIN"), Tag(name: "QUEMA QUEMA"),
            Tag(name: "COMPASS BERLIN"), Tag(name: "BRESH"), Tag(name: "QUEMA QUEMA"),
            Tag(name: "BRESH"), Tag(name: "COMPASS BERLIN"), Tag(name: "QUEMA QUEMA"),
            Tag(name: "COMPASS BERLIN"), Tag(name: "BRESH"), Tag(name: "QUEMA QUEMA"),
            Tag(name: "BRESH"), Tag(name: "COMPASS BERLIN"), Tag(name: "QUEMA QUEMA"),
            Tag(name: "COMPASS BERLIN"), Tag(name: "BRESH"), Tag(name: "QUEMA QUEMA"),
            Tag(name: "QUEEN"), Tag(name: "MUDVAYNE"), Tag(name: "SYSTEM OF A DOWN"),
            Tag(name: "MASTODON"), Tag(name: "CELLDWELLER"), Tag(name: "STATIC-X"),
            Tag(name: "AVENGED SEVENFOLD")
        ]
        _partyFilterVM = StateObject(wrappedValue: PartyFilterViewModel(state: tags))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Image("bombo")
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showModal.toggle()
                    }, label: {
                        Label("modal", systemImage: "line.3.horizontal.decrease.circle")
                    })
                    
                }
            }
        }
        .sheet(isPresented: $showModal, content: {
            PartyFilterView(partyFilterVM: partyFilterVM, searchText: $searchText, text: $text)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
