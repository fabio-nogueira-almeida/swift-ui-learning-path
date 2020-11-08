//
//  DateExtensionTests.swift
//  swift-ui-learning-pathTests
//
//  Created by Fábio Nogueira de Almeida on 06/11/20.
//

import XCTest
@testable import swift_ui_learning_path

class DateExtensionTests: XCTestCase {

	func testShouldGetIntervalOfDates(from: Date, to: Date) {
		let daysAdded = 10
		let fromDate = Date()
		let toDate = Calendar.current.date(byAdding: .day,
												   value: daysAdded,
												   to:Date())
		
		let sut = Date.intervalBetween(from: fromDate, to:toDate!)
		
		XCTAssertEqual(sut.count, daysAdded)
	}


}
