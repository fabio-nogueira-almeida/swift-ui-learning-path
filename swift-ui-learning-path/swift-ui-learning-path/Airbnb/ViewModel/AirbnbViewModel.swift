//
//  HotelViewModel.swift
//  iOSTestProject
//
//  Created by Fábio Nogueira de Almeida on 10/11/20.
//  Copyright © 2020 ThoughtWorks. All rights reserved.
//

import Foundation

struct AirbnbViewModel {
	var hotels: [Airbnb]
	
	func findBestHotel(isLoyalty: Bool = false) -> Airbnb? {
		var bestHotel = hotels.first
		
		guard let bestHotelCurrent = bestHotel else { return nil }
		
		for hotel in hotels {
			if isLoyalty == true {
				if hotel.loyaltyPrice.weekday < bestHotelCurrent.loyaltyPrice.weekday {
					bestHotel = hotel
				}
			} else {
				if hotel.regularPrice.weekday < bestHotelCurrent.regularPrice.weekday {
					bestHotel = hotel
				}
			}
		}
		
		return bestHotel
	}
}
