//
//  CustomCorners.swift
//  EcommerceApple (iOS)
//
//  Created by Jacob Ko on 2022/01/20.
//

import SwiftUI

struct CustomCorners: Shape{
	
	var corners: UIRectCorner
	var radius: CGFloat
	
	func path(in rect: CGRect) -> Path {
		let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
		
		return Path(path.cgPath)
	}
}
