//
//  Hotel.swift
//  swift-ui-learning-path
//
//  Created by Fábio Nogueira de Almeida on 06/11/20.
//

import Foundation

struct Hotel {
	var name: String
	var classification: Int
	var regular: Price
	var exclusive: Price
	
	func price(for date: Date, exclusive: Bool = false) -> Float {
		if NSCalendar.current.isDateInWeekend(date) {
			if exclusive {
				return self.exclusive.weekend
			} else {
				return regular.weekend
			}
		} else {
			if exclusive {
				return self.exclusive.week
			} else {
				return regular.week
			}
		}
	}
}

struct Price {
	var week: Float
	var weekend: Float
}

struct HotelProvider {
	
	// MARK: Properties
	
	var availables: [Hotel]?
	
	private var parqueDasFlores: Hotel {
		let regularPrice = Price(week: 110, weekend: 90)
		let exclusivePrice = Price(week: 80, weekend: 80)
		let hotel = Hotel(name: "Parque das flores",
						  classification: 3,
						  regular: regularPrice,
						  exclusive: exclusivePrice)
		return hotel
	}
	
	private var jardimBotanico: Hotel {
		let regularPrice = Price(week: 160, weekend: 60)
		let exclusivePrice = Price(week: 110, weekend: 50)
		let hotel = Hotel(name: "Jardim Botânico",
						  classification: 4,
						  regular: regularPrice,
						  exclusive: exclusivePrice)
		return hotel
	}
	
	private var marAtlantico: Hotel {
		let regularPrice = Price(week: 220, weekend: 150)
		let exclusivePrice = Price(week: 100, weekend: 40)
		let hotel = Hotel(name: "Mar Atlântico",
						  classification: 5,
						  regular: regularPrice,
						  exclusive: exclusivePrice)
		return hotel
	}
	
	// MARK: Public
	
	init() {
		availables = [parqueDasFlores, jardimBotanico, marAtlantico]
	}
}
