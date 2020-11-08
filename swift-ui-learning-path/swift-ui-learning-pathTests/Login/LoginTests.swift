//
//  LoginTests.swift
//  swift-ui-learning-pathTests
//
//  Created by Fábio Nogueira de Almeida on 05/11/20.
//

@testable import swift_ui_learning_path
import XCTest

class LoginTests: XCTestCase {
	private var viewModel: LoginViewModel! // Subject Under Test
	private var service: LoginServiceMock!
	private var didCallLoginDidSucceed: Bool!

	override func setUp() {
		super.setUp()
		didCallLoginDidSucceed = false
		service = .init()
		viewModel = .init(
			service: service,
			loginDidSucceed: { [weak self] in
				self?.didCallLoginDidSucceed = true
			}
		)
	}

	func testDefaultInitialState() {
		XCTAssertEqual(
			viewModel.state,
			LoginViewState(
				email: "",
				password: "",
				isLoggingIn: false,
				isShowingErrorAlert: false
			)
		)
		XCTAssertFalse(viewModel.state.canSubmit)
		XCTAssert(viewModel.state.footerMessage.isEmpty)
	}

	func testSuccessfulLoginFlow() {
		viewModel.bindings.email.wrappedValue = "email@gmail.com"
		viewModel.bindings.password.wrappedValue = "x"
		XCTAssert(viewModel.state.canSubmit)
		XCTAssert(viewModel.state.footerMessage.isEmpty)

		viewModel.login()
		XCTAssertEqual(
			viewModel.state,
			LoginViewState(
				email: "email@gmail.com",
				password: "x",
				isLoggingIn: true,
				isShowingErrorAlert: false
			)
		)
		XCTAssertFalse(viewModel.state.canSubmit)
		XCTAssertEqual(viewModel.state.footerMessage, LoginViewState.isLoggingInFooter)
		XCTAssertEqual(service.lastReceivedEmail, "email@gmail.com")
		XCTAssertEqual(service.lastReceivedPassword, "x")

		service.completion?(nil)
		XCTAssert(didCallLoginDidSucceed)
	}

	func testFailableLoginFlow() {
		viewModel.bindings.email.wrappedValue = "email@gmail.com"
		viewModel.bindings.password.wrappedValue = "x"
		XCTAssert(viewModel.state.canSubmit)
		XCTAssert(viewModel.state.footerMessage.isEmpty)

		viewModel.login()
		XCTAssertEqual(
			viewModel.state,
			LoginViewState(
				email: "email@gmail.com",
				password: "x",
				isLoggingIn: true,
				isShowingErrorAlert: false
			)
		)
		XCTAssertFalse(viewModel.state.canSubmit)
		XCTAssertEqual(viewModel.state.footerMessage, LoginViewState.isLoggingInFooter)
		XCTAssertEqual(service.lastReceivedEmail, "email@gmail.com")
		XCTAssertEqual(service.lastReceivedPassword, "x")

		struct FakeError: Error {}
		service.completion?(FakeError())
		XCTAssertEqual(
			viewModel.state,
			LoginViewState(
				email: "email@gmail.com",
				password: "x",
				isLoggingIn: false,
				isShowingErrorAlert: true
			)
		)
		XCTAssert(viewModel.state.canSubmit)
		XCTAssert(viewModel.state.footerMessage.isEmpty)
	}
}

private final class LoginServiceMock: LoginService {
	var lastReceivedEmail: String?
	var lastReceivedPassword: String?
	var completion: ((Error?) -> Void)?

	func login(
		email: String,
		password: String,
		completion: @escaping (Error?) -> Void
	) {
		lastReceivedEmail = email
		lastReceivedPassword = password
		self.completion = completion
	}
}
