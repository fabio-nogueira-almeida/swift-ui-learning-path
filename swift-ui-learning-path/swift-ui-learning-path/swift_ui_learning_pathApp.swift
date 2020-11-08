//
//  swift_ui_learning_pathApp.swift
//  swift-ui-learning-path
//
//  Created by Fábio Nogueira de Almeida on 05/11/20.
//

import SwiftUI

@main
struct swift_ui_learning_pathApp: App {
    var body: some Scene {
        WindowGroup {
//			SimpleMVVMContentView(viewModel: ContentViewModel())
			
			NavigationView {
//				LoginView(model: .init(initialState: .init(),
//								   service: FailWithDelayLoginService(),
//								   loginDidSucceed: {})
//				)
				
				let hotels = HotelProvider().availables
				ReservationView(viewModel: ReservationViewModel(data: hotels!))
			}
        }
    }
}

struct FailWithDelayLoginService: LoginService {
	func login(
		email: String,
		password: String,
		completion: @escaping (Error?) -> Void
	) {
		DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
			completion(NSError(domain: "", code: 1, userInfo: nil))
		}
	}
}
