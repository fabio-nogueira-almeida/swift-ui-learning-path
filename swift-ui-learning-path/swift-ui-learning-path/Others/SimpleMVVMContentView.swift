//
//  ContentView.swift
//  swift-ui-learning-path
//
//  Created by Fábio Nogueira de Almeida on 05/11/20.
//

import SwiftUI

struct SimpleMVVMContentView: View {
	
	@ObservedObject private var viewModel: ContentViewModel
	
	init(viewModel: ContentViewModel) {
		self.viewModel = viewModel
	}
	
    var body: some View {
		Text(viewModel.state.isLoading ? "Carregando..." : viewModel.state.message)
			.onAppear(perform: { viewModel.loadData() })
            
    }
}

struct ContentViewModelState {
	var isLoading = false
	var message = ""
}

class ContentViewModel: ObservableObject {
	@Published private(set) var state: ContentViewModelState
	
	init(initialState: ContentViewModelState = .init()) {
		self.state = initialState
	}
	
	func loadData() {
		state.isLoading = true
		DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
			self.state.isLoading = false
			self.state.message = "Olá Mundo"
		}
	}
}

// Mark: Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		SimpleMVVMContentView(viewModel: .init())
    }
}
