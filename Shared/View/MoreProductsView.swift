//
//  MoreProductsView.swift
//  EcommerceApple (iOS)
//
//  Created by Jacob Ko on 2022/01/21.
//

import SwiftUI

struct MoreProductsView: View {
	// MARK: -  PROPERTY
	
	// MARK: -  BODY
	var body: some View {
		VStack {
			Text("More Products")
				.font(.custom(customFontBold, size: 24))
				.foregroundColor(.black)
				.hLeading()
		} //: VSTACK
		.padding()
		.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
		.background(Color("HomeBG").ignoresSafeArea())
	}
	// MARK: -  FUNCTION
}

// MARK: -  PREVIEW
struct MoreProductsView_Previews: PreviewProvider {
	static var previews: some View {
		MoreProductsView()
	}
}
