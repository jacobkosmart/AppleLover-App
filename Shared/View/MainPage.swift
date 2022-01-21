//
//  MainPage.swift
//  EcommerceApple (iOS)
//
//  Created by Jacob Ko on 2022/01/20.
//

import SwiftUI

struct MainPage: View {
	// MARK: -  PROPERTY
	// Current Tab..
	@State var currentTab: Tab = .Home
	
	// Hiding Tab Bar..
	init() {
		UITabBar.appearance().isHidden = true
	}
	
	
	// MARK: -  BODY
	var body: some View {
		
		VStack (spacing: 0){
			
			// Tab View..
			TabView(selection: $currentTab) {
				Home().tag(Tab.Home)
				Text("Liked").tag(Tab.Liked)
				Text("Cart").tag(Tab.Cart)
				Text("Profile").tag(Tab.Profile)
			}
			
			// Custom Tab Bar..
			HStack (spacing: 0){
				ForEach(Tab.allCases, id: \.self) { tab in
					Button {
						// updating tab..
						currentTab = tab
					} label: {
						Image(tab.rawValue)
							.resizable()
							.renderingMode(.template)
							.aspectRatio(contentMode: .fit)
							.frame(width: 22, height: 22)
						// Applying litter shadow at bg..
							.background(
								Color("Color1")
									.opacity(0.1)
									.cornerRadius(5)
								// Blur
									.blur(radius: 5)
								// Making little big..
									.padding(-7)
									.opacity(currentTab == tab ? 1 : 0)
							)
							.frame(maxWidth: .infinity)
							.foregroundColor(currentTab == tab ? Color("Color1") : Color.black.opacity(0.3))
					}
				}
			} //: HSTACK
			.padding([.horizontal, .top])
			.padding(.bottom, 10)
		} //: VSTACK
		.background(Color("HomeBG").ignoresSafeArea())
	}
}

// MARK: -  PREVIEW
struct MainPage_Previews: PreviewProvider {
	static var previews: some View {
		MainPage()
			.previewDevice("iPhone 13")
		MainPage()
			.previewDevice("iPhone 8")
	}
}

// MARK: -  ENUM
// Making case Iteratable..
// Tab Cases..
enum Tab: String, CaseIterable {
	// Raw Value must be image name in asset..
	case Home = "Home"
	case Liked = "Liked"
	case Cart = "Cart"
	case Profile = "Profile"
}


