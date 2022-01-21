//
//  Home.swift
//  EcommerceApple (iOS)
//
//  Created by Jacob Ko on 2022/01/21.
//

import SwiftUI

struct Home: View {
	// MARK: -  PROPERTY
	@Namespace var animation
	@StateObject var customData: CustomViewModel = CustomViewModel()
	@StateObject var homeData: HomeViewModel = HomeViewModel()
	
	// MARK: -  BODY
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack (spacing: 15) {
				
				// Search Bar..
				SearchBarView()
				
				// Main Title
				Text("2022\n최신 애플 기기")
					.font(.custom(customData.customFontBold, size: 30))
					.hLeading()
					.padding(.top)
					.padding(.horizontal, 25)
				
					// Products Tabs..
				CategoryBarView(
					homeData: homeData,
					customData: customData,
					animation: animation
				)
				
				// Projects Pages
				ProductPageView(homeData: homeData, customData: customData)
				
			} //: VSTACK
			.padding(.vertical)
			
		} //: SCROLL
		.infinity()
		.background(Color("HomeBG"))
		// Updating data whenever tab changes..
		.onChange(of: homeData.productType) { newValue in
			homeData.filterProductByType()
		}
		.sheet(isPresented: $homeData.showMoreProductsOnType) {
			MoreProductsView()
		}
	}
}

// MARK: -  PREVIEW
struct Home_Previews: PreviewProvider {
	static var previews: some View {
		Home()
			.previewDevice("iPhone 13")
		Home()
			.previewDevice("iPhone 8")
	}
}

// MARK: -  EXTRACT SUBVIEWS
// SearchBarView
struct SearchBarView: View {
	var body: some View {
		HStack (spacing: 15) {
			Image(systemName: "magnifyingglass")
				.font(.title2)
				.foregroundColor(.gray)
			
			// Will be separate view for search bar..
			TextField("검색", text: .constant(""))
				.disabled(true)
		} //: HSTACK
		.padding(.vertical, 12)
		.padding(.horizontal)
		.background(
			Capsule()
				.strokeBorder(.gray, lineWidth: 0.8)
		)
		.frame(width: getRect().width / 1.6)
		.padding(.horizontal, 25)
	}
}

// CategoryBarView
struct CategoryBarView: View {
	@StateObject var homeData: HomeViewModel
	@StateObject var customData: CustomViewModel
	var animation : Namespace.ID
	
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack (spacing: 18){
				ForEach(ProductType.allCases, id: \.self) { type in
					// Product Type View..
					Button {
						// Updating current Type..
						withAnimation {
							homeData.productType = type
						}
					} label: {
						Text(type.rawValue)
							.font(.custom(customData.customFontBold, size: 15))
						// Changing Color based on Current product type..
							.foregroundColor(homeData.productType == type ? Color("Color1") : Color.gray)
							.padding(.bottom, 10)
						// Adding Indicator at bottom..
							.overlay(
								// Adding Matched Geometry Effect
								ZStack {
									if homeData.productType == type {
										Capsule()
											.fill(Color("Color1"))
											.matchedGeometryEffect(id: "PRODUCTTAP", in: animation)
											.frame(height: 2)
									} else {
										Capsule()
											.fill(Color.clear)
											.frame(height: 2)
									}
								} //: ZSTACK
									.padding(.horizontal, -5)
								,alignment: .bottom
							)
					}
				}
				.padding(.horizontal, 5)
			} //: HSTACK
			.padding(.top, 28)
			.padding(.leading, 30)
		} //: SCROLL
	}
}


// ProductPageView..

struct ProductPageView: View {
	
	@StateObject var homeData: HomeViewModel = HomeViewModel()
	@StateObject var customData: CustomViewModel = CustomViewModel()
	
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack (spacing: 25) {
				ForEach(homeData.filteredProducts) { product in
					
					// Product Card View..
					ProductCardView(customData: customData, product: product)
				}
			} //: HSTACK
			.padding(.horizontal, 25)
			.padding(.bottom)
			.padding(.top, 80)
		} //: SCROLL
		.padding(.top, 30)
		
		// See More Button..
		// This button will show all produts on the current product type..
		Button {
			homeData.showMoreProductsOnType.toggle()
		} label: {
			// label image at right..
			Label {
				Image(systemName: "arrow.right")
			} icon: {
				Text("더 많은 상품 보기")
			}
			.font(.custom(customData.customFontBold, size: 15))
			.foregroundColor(Color("Color1"))
		}
		.hTrailing()
		.padding(.trailing)
		.padding(.top, 10)
	}
}


// ProdutCarView
struct ProductCardView: View {
	
	@StateObject var customData: CustomViewModel
	var product: Product
	
	var body: some View {
		VStack (spacing: 10) {
			Image(product.productImage)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: getRect().width / 2.5, height: getRect().width / 2.5)
			// Moving image to top to lokk like its fixed at hafl top..
				.offset(y: -80)
				.padding(.bottom, -80)
			
			Text(product.title)
				.font(.custom(customData.customFontBold, size: 18))
				.padding(.top)
			
			
			Text(product.subtitle)
				.font(.custom(customData.customFontRegular, size: 14))
				.foregroundColor(.gray)
			
			Text(product.price)
				.font(.custom(customData.customFontBold, size: 16))
				.padding(.top, 5)
				.foregroundColor(Color("Color1"))
		} //: VSTACK
		.padding(.horizontal, 20)
		.padding(.bottom, 22)
		.background(
			Color.white
				.cornerRadius(25)
		)
	}
}



