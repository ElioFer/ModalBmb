//
//  MVIBaseView.swift
//  ModalBmb
//
//  Created by Elio Fernandez on 23/04/2024.
//

import SwiftUI

protocol MVIViewState {}
protocol MVIIntent {}

protocol MVIBaseViewModel: ObservableObject {
    associatedtype Intent: MVIIntent
    associatedtype ViewState: MVIViewState
    var state: ViewState { get }
    func onIntent(_ intent: Intent)
}

protocol MVIBaseView: View {
    associatedtype ViewModel: MVIBaseViewModel
    var viewModel: ViewModel { get }
}
