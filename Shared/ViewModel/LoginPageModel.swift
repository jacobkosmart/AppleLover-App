//
//  LoginPageModel.swift
//  EcommerceApple (iOS)
//
//  Created by Jacob Ko on 2022/01/20.
//

import SwiftUI

class LoginPageModel: ObservableObject {
	
	// MARK: -  PROPERTY
	// Login Properties
	@Published var email: String = ""
	@Published var password: String = ""
	@Published var showPassword: Bool = false
	
	// Register Properties
	@Published var registerUser: Bool = false
	@Published var reEnterPassword: String = ""
	@Published var showReEnterPassword: Bool = false
	
	let customFontBold = "Raleway-bold"
	let customFontRegular = "Raleway-regular"
	
	// Log Status..
	@AppStorage("logStatus") var logStatus: Bool = false
	
	// MARK: -  FUNCTION
	// Login call..
	func Login() {
		withAnimation {
			logStatus = true
		}
	}
	
	func Register() {
		withAnimation {
			logStatus = true
		}
	}
	
	func ForgetPassword() {
		// Do Action Here..
	}
}


