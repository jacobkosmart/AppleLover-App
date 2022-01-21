//
//  CustomModifiers.swift
//  EcommerceApple (iOS)
//
//  Created by Jacob Ko on 2022/01/21.
//

import SwiftUI

extension View {
	// Layout Modifier
	// MARK: -  Vertical Center
	func vCenter()-> some View {
		self.frame(maxHeight: .infinity, alignment: .center)
	}
	
	// MARK: -  Vertical Top
	func vTop() -> some View {
		self.frame(maxHeight: .infinity, alignment: .top)
	}
	
	// MARK: -  Vertical Bottom
	func vBottom() -> some View {
		self.frame(maxHeight: .infinity, alignment: .bottom)
	}
	
	// MARK: -  Horizontal Center
	func hCenter() -> some View {
		self.frame(maxWidth: .infinity, alignment: .center)
	}
	
	// MARK: -  Horizontal Leading
	func hLeading() -> some View {
		self.frame(maxWidth: .infinity, alignment: .leading)
	}
	
	// MARK: -  Horizontal Traling
	func hTrailing() -> some View {
		self.frame(maxWidth: .infinity, alignment: .trailing)
	}
	
	// MARK: -  All Infinity
	func infinity() -> some View {
		self.frame(maxWidth: .infinity, maxHeight: .infinity)
	}
	
	// MARK: -  UISCREEN BOUNDS
	// Extending View to get Screen Bounds..
	// 기기의 resolution 사이즈 가져옴
	func getRect() -> CGRect {
		return UIScreen.main.bounds
	}
}
