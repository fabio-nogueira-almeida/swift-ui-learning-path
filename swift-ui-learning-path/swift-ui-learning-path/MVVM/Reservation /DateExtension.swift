//
//  DateExtension.swift
//  swift-ui-learning-path
//
//  Created by Fábio Nogueira de Almeida on 06/11/20.
//

import Foundation

extension Date {
	public static func intervalBetween(from fromDate: Date, to toDate: Date) -> [Date] {
		var dates = [Date]()

		var counterDate = fromDate
		while counterDate <= toDate {
			let dayReservation = Calendar.current.date(byAdding: .day,
													   value: 1,
													   to:counterDate)
			dates.append(counterDate)
			counterDate = dayReservation!
		}
		
		return dates
	}
}
