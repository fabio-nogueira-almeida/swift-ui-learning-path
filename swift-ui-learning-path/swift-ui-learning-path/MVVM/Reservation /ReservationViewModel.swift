//
//  HotelViewModel.swift
//  swift-ui-learning-path
//
//  Created by Fábio Nogueira de Almeida on 06/11/20.
//

import Foundation

//MARK: - Reservation

struct Reservation {
	var total: Float
	var hotel: Hotel
}

//MARK: - ReservationViewModel

final class ReservationViewModel: ObservableObject {
	
	// MARK: - Properties
	
	@Published var state: ReservationViewState
	
	// MARK: - Properties - Private
	
	private var data: [Hotel]
	
	private var budget = [Float:Hotel]()
	
	// MARK: - Initialize
	
	init(data: [Hotel], initialState: ReservationViewState = .init()) {
		self.data = data
		self.state = initialState
	}
	
	// MARK: - Public
	
	func bestHotelAction() {
		state.chepeastHotelName = findChepeast(from: state.checkInDate,
											   to: state.checkOutDate,
											   exclusive: state.isRewardClient).name
		state.isShowingAlert = true
	}
	
	// MARK: - Private
	
	private func findChepeast(from fromDate: Date, to toDate: Date, exclusive: Bool = false) -> Hotel {
		var reservations = [Reservation]()
		
		// get dates
		
		let reservationsDates = Date.intervalBetween(from: fromDate, to: toDate)

		// total per hotel
		
		for hotel in data {
			var totalPrice = Float(0)
			
			for date in reservationsDates {
				let price = hotel.price(for: date, exclusive: exclusive)
				totalPrice = totalPrice + price
			}
			
			reservations.append(Reservation(total: totalPrice, hotel: hotel))
		}
		
		
		// less price
		
		let chepeastReservation = reservations.min (by: { (a, b) -> Bool in
			if a.total == b.total {
				return a.hotel.classification > b.hotel.classification
			} else {
				return a.total < b.total
			}
			
		})
		
		return chepeastReservation!.hotel
	}
}

// MARK: - ReservationViewState

struct ReservationViewState {
	var checkInDate = Date()
	var checkOutDate = Date()
	var isRewardClient = false
	var isShowingAlert = false
	var chepeastHotelName = ""
}
