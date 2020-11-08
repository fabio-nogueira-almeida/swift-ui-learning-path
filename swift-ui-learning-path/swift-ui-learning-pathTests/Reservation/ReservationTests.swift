//
//  ReservationTests.swift
//  swift-ui-learning-pathTests
//
//  Created by Fábio Nogueira de Almeida on 06/11/20.
//

import XCTest
@testable import swift_ui_learning_path

class ReservationTests: XCTestCase {
	
	// MARK: - Model && Provider
	
	func testShouldReturnThreeHotels() {
		let sut = HotelProvider()
		XCTAssertEqual(sut.availables?.count, 3)
	}
	
	func testShouldVerifyIfModelHasAllInformationsNeeded() {
		let sut = HotelProvider()
		XCTAssertNotNil(sut.availables?.first?.name)
		XCTAssertNotNil(sut.availables?.first?.classification)
		XCTAssertNotNil(sut.availables?.first?.regular.week)
		XCTAssertNotNil(sut.availables?.first?.regular.weekend)
		XCTAssertNotNil(sut.availables?.first?.exclusive.week)
		XCTAssertNotNil(sut.availables?.first?.exclusive.weekend)
	}

	func testShouldCalcuteDiaryPriceForWeekday() {
		let hotels = HotelProvider()
		let sut = hotels.availables?.first
		
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		let date = dateFormatter.date(from: "2020-11-06")
		
		let price = sut?.price(for: date!)
		
		XCTAssertEqual(price, 110)
	}
	
	func testShouldCalcuteDiaryPriceForWeekend() {
		let hotels = HotelProvider()
		let sut = hotels.availables?.first
		
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		let date = dateFormatter.date(from: "2020-11-07")
		
		let price = sut?.price(for: date!)
		
		XCTAssertEqual(price, 90)
	}
	
	func testShouldCalcuteDiaryPriceForExclusiveWeekday() {
		let hotels = HotelProvider()
		let sut = hotels.availables?.first
		
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		let date = dateFormatter.date(from: "2020-11-06")
		
		let price = sut?.price(for: date!, exclusive: true)
		
		XCTAssertEqual(price, 80)
	}
	
	func testShouldCalcuteDiaryPriceForExclusiveWeekend() {
		let hotels = ()
		let sut = hotels.availables?.first
		
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		let date = dateFormatter.date(from: "2020-11-07")
		
		let price = sut?.price(for: date!, exclusive: true)
		
		XCTAssertEqual(price, 80)
	}
	
	func testShouldFindTheChepeastHotelBetweenDates() {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		
		let startDate = dateFormatter.date(from: "2020-03-16")!
		let endDate = dateFormatter.date(from: "2020-03-18")!
		
		let sut = ReservationViewModel(data: HotelProvider().availables!)
		let hotel = sut.getChepeast(from: startDate, to: endDate)
		
		XCTAssertEqual(hotel.name , "Parque das flores")
	}
	
	func testShouldFindTheChepeastHotelBetweenDatesSample2() {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		
		let startDate = dateFormatter.date(from: "2020-03-20")!
		let endDate = dateFormatter.date(from: "2020-03-22")!
		
		let sut = ReservationViewModel(data: HotelProvider().availables!)
		let hotel = sut.getChepeast(from: startDate, to: endDate)
		
		XCTAssertEqual(hotel.name , "Jardim Botânico")
	}
	
	// MARK: - ReservationViewModel
	
	func testShouldFindTheChepeastHotelBetweenDatesSample3() {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		
		let startDate = dateFormatter.date(from: "2020-03-26")!
		let endDate = dateFormatter.date(from: "2020-03-28")!
		
		let sut = ReservationViewModel(data: HotelProvider().availables!)
		let hotel = sut.getChepeast(from: startDate, to: endDate, exclusive: true)
		
		XCTAssertEqual(hotel.name , "Mar Atlântico")
	}
	
	// MARK: - ReservationView

}

