//
//  ReservationView.swift
//  swift-ui-learning-path
//
//  Created by Fábio Nogueira de Almeida on 06/11/20.
//

import SwiftUI

// MARK: - ReservationView

struct ReservationView: View {
	
	// MARK: - Properties
	
	@ObservedObject private var viewModel: ReservationViewModel
	
	@State private var checkInDate = Date()
	@State private var checkOutDate = Date()
	@State private var isRewardClient = false
	
	// MARK: - Initialize
	
	init(viewModel: ReservationViewModel) {
		self.viewModel = viewModel
	}
	
	// MARK: - Body

	var body: some View {
		ScrollView {
			VStack(spacing: 16) {
				Text("Check in date")
				DatePicker(
					"",
					selection: $viewModel.state.checkInDate,
					displayedComponents: .date
				).labelsHidden()

				Text("Check out date")
				DatePicker(
					"",
					selection: $viewModel.state.checkOutDate,
					displayedComponents: .date
				).labelsHidden()

				Text("Reward client?")
				Toggle(
					"",
					isOn: $viewModel.state.isRewardClient
				).labelsHidden()

				Button("Best hotel") {
					viewModel.bestHotelAction()
				}
			}.padding(16)
		}
		.alert(isPresented: $viewModel.state.isShowingAlert) {
			Alert(
				title: Text(viewModel.state.chepeastHotelName)
			)
		}
	}
}

// MARK: - Preview

struct ReservationView_Previews: PreviewProvider {
	static var previews: some View {
		let hotels = HotelProvider().availables
		ReservationView(viewModel: ReservationViewModel(data: hotels!))
	}
}
