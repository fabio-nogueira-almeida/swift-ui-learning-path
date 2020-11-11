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
