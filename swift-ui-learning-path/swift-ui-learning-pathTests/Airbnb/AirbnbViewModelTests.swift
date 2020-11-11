//
//  HotelViewModelTests.swift
//  iOSTestProjectTests
//
//  Created by Fábio Nogueira de Almeida on 10/11/20.
//  Copyright © 2020 ThoughtWorks. All rights reserved.
//

import XCTest
@testable import swift_ui_learning_path

class AirbnbViewModelTests: XCTestCase {

    // MARK: - Tests
	
	func testFindBestHotelWhenHotelHasTwoValuesExpectHotelWithBestValue() {
		let hotel1 = Airbnb(name: "Hotel1",
						   classification: 1,
						   regularPrice: Diary(weekday: 100, weekend: 200),
						   loyaltyPrice: Diary(weekday: 0, weekend: 0))
		let hotel2 = Airbnb(name: "Hotel2",
						   classification: 1,
						   regularPrice: Diary(weekday: 50, weekend: 80),
						   loyaltyPrice: Diary(weekday: 0, weekend: 0))
		let sut = AirbnbViewModel(hotels: [hotel1, hotel2])
		
		let hotelBestPrice = sut.findBestHotel()
		
		XCTAssertEqual(hotelBestPrice?.name, hotel2.name)
	}
	
	func testFindBestHotelWhenHotelHasNoValuesExpectReturnNil() {
		let sut = AirbnbViewModel(hotels: [])
		
		let bestHotel = sut.findBestHotel()
		
		XCTAssertNil(bestHotel)
	}
	
	func testFindBestHotelWhenHotelHasTwoValuesAndIsLoyaltyExpectHotelWithBestValue() {
		let hotel1 = Airbnb(name: "Hotel1",
						   classification: 1,
						   regularPrice: Diary(weekday: 0, weekend: 0),
						   loyaltyPrice: Diary(weekday: 40, weekend: 70))
		let hotel2 = Airbnb(name: "Hotel2",
						   classification: 1,
						   regularPrice: Diary(weekday: 0, weekend: 0),
						   loyaltyPrice: Diary(weekday: 60, weekend: 120))
		
		let sut = AirbnbViewModel(hotels: [hotel1, hotel2])
		
		let hotelBestPriceLoyalty = sut.findBestHotel(isLoyalty: true)
		
		XCTAssertEqual(hotelBestPriceLoyalty?.name, hotel1.name)
	}
}
