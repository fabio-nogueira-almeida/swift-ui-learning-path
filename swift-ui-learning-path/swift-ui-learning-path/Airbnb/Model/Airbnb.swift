//
//  Hotel.swift
//  iOSTestProject
//
//  Created by Fábio Nogueira de Almeida on 10/11/20.
//  Copyright © 2020 ThoughtWorks. All rights reserved.
//

import Foundation

struct Airbnb {
	var name: String
	var classification: Int
	var regularPrice: Diary
	var loyaltyPrice: Diary
}

struct Diary {
	var weekday: Float
	var weekend: Float	
}
