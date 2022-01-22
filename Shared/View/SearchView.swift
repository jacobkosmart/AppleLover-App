//
//  SearchView.swift
//  EcommerceApple (iOS)
//
//  Created by Jacob Ko on 2022/01/21.
//

import SwiftUI

struct SearchView: View {
	// MARK: -  PROPERTY
	var animation: Namespace.ID
	@EnvironmentObject var homeData: HomeViewModel
	// Activating text field with the help of FocusState..
	@FocusState var startTF: Bool
	
	// MARK: -  BODY
	var body: some View {
		VStack (spacing: 0) {
			
			// Search Bar..
			HStack (spacing: 20) {
				
				// Back Button..
				Button  {
					withAnimation {
						homeData.searchActivated = false
					}
					homeData.searchText = ""
				}
				label: {
					Image(systemName: "arrow.left")
						.font(.title2)
						.foregroundColor(.black.opacity(0.7))
				}
				// Search Bar..
				HStack (spacing: 15) {
					Image(systemName: "magnifyingglass")
						.font(.title2)
						.foregroundColor(.gray)
					
					// Will be separate view for search bar..
					TextField("검색", text: $homeData.searchText)
						.focused($startTF)
						.textCase(.lowercase)
						.disableAutocorrection(true)
				} //: HSTACK
				.padding(.vertical, 12)
				.padding(.horizontal)
				.background(
					Capsule()
						.strokeBorder(Color("Color1"), lineWidth: 1.5)
				)
				.matchedGeometryEffect(id: "SEARCHBAR", in: animation)
				.padding(.trailing, 20)
			}
			.padding([.horizontal, .top])
			.padding(.bottom, 10)
			
			// Showing progress if searching..
			// else showing no results fould if empty..
			if let products = homeData.searchedProducts {
				if products.isEmpty {
					// No Results Found..
					VStack (spacing: 10){
						
						Image("NotFound")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.padding(.top, 60)
						
						Text("아이템을 찾을 수 없습니다")
							.font(.custom(customFontBold, size: 22))
						
						Text("정확한 애플 기기명을 다시 입력해 보세요")
							.font(.custom(customFontRegular, size: 16))
							.foregroundColor(.gray)
							.multilineTextAlignment(.center)
							.padding(.horizontal, 30)
						
					} //: VSTACK
					.padding()
				} else {
					// Filter Results..
					ScrollView(.vertical, showsIndicators: false) {
						
						VStack (spacing: 0) {
							// Found Text..
							Text("\(products.count) 개의 결과를 찾았습니다")
								.font(.custom(customFontBold, size: 24))
								.padding(.vertical)
							
							// Staggered Grid
							StaggeredGrid(columns: 2, spacing: 20, list: products) { product in
								// Card View
								SearchCardView(product: product)
							}
						} //: VSTACK
						.padding()
					}
				}
			} else {
				ProgressView()
					.padding(.top, 30)
					.opacity(homeData.searchText == "" ? 0 : 1)
			}
			
		} //: VSTACK
		.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
		.background(Color("HomeBG").ignoresSafeArea())
		.onAppear {
			DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
				startTF = true
			}
		}
	}
	// MARK: -  FUNCTION
}

 // MARK: -  PREVIEW
struct SearchView_Previews: PreviewProvider {
	static var previews: some View {
			Home()
	}
}

// MARK: -  EXTRACT SUBVIEW
// ProdutCarView
struct SearchCardView: View {
	
	var product: Product
	
	var body: some View {
		VStack (spacing: 10) {
			Image(product.productImage)
				.resizable()
				.aspectRatio(contentMode: .fit)
			// Moving image to top to lokk like its fixed at half top..
				.offset(y: -50)
				.padding(.bottom, -50)
			
			Text(product.title)
				.font(.custom(customFontBold, size: 18))
				.padding(.top)
			
			
			Text(product.subtitle)
				.font(.custom(customFontRegular, size: 14))
				.foregroundColor(.gray)
			
			Text(product.price)
				.font(.custom(customFontBold, size: 16))
				.padding(.top, 5)
				.foregroundColor(Color("Color1"))
		} //: VSTACK
		.padding(.horizontal, 20)
		.padding(.bottom, 22)
		.background(
			Color.white
				.cornerRadius(25)
		)
		.padding(.top, 50)
	}
}
