//
//  OnBoardingView.swift
//  EcommerceApple
//
//  Created by Jacob Ko on 2022/01/20.
//

import SwiftUI

struct OnBoardingView: View {
	
	// MARK: -  PROPERTY
	
	// To use the custom font on all pages..
	let customFontBold = "Raleway-bold"
	let customFontRegular = "Raleway-regular"
	
	// MARK: -  BODY
	var body: some View {
		
		VStack(alignment: .leading) {
			Text("Find your\nGadget")
				.font(.custom(customFontBold, size: 55))
			// Since we added all three fonts in Info.plist
			// It can called all of those fonts with any names..
				.foregroundColor(.white)
			
			Image("OnBoard")
				.resizable()
				.aspectRatio(contentMode: .fit)
			
			Button {
				
			} label: {
				Text("Get Started")
					.font(.custom(customFontBold, size: 18))
					.padding(.vertical, 18)
					.frame(maxWidth: .infinity)
					.background(.white)
					.cornerRadius(20)
					.shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
					.foregroundColor(Color("Purple"))
			}
			.padding(.horizontal, 30)
			// Adding some adjustments only for larger displays..
			.offset(y: getRect().height < 750 ? 20 : 40)
			
			Spacer()

		} //: VSTACK
		.padding()
		.padding(.top, getRect().height < 750 ? 0 : 20)
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(
			Color("Purple")
		) 
	}
}

// MARK: -  PREVIEW
struct OnBoardingView_Previews: PreviewProvider {
	static var previews: some View {
		OnBoardingView()
			.previewDevice("iPhone 13")
		OnBoardingView()
			.previewDevice("iPhone 8")
	}
}


// MARK: -  EXTENTION
extension View {
	// Extending View to get Screen Bounds..
	// 기기의 resolution 사이즈 가져옴
	func getRect() -> CGRect {
		return UIScreen.main.bounds
	}
}
