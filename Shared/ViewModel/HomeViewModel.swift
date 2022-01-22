//
//  HomeViewModel.swift
//  EcommerceApple (iOS)
//
//  Created by Jacob Ko on 2022/01/21.
//

import SwiftUI

// Using combine to monitor earch field and if user leaves for .5 secs then statrts searching...
// to avoid
import Combine

class HomeViewModel: ObservableObject {
	
	// MARK: -  PROPERTY
	
	@Published var productType: ProductType = .Phones
	
	// Sample Products
	@Published var products: [Product] = [
		Product(type: .Phones, title: "iPhone 13", subtitle: "A15 - Pink", price: "$699", productImage: "iPhone13"),
		Product(type: .Phones, title: "iPhone 12", subtitle: "A14 - Blue", price: "$599", productImage: "iPhone12"),
		Product(type: .Phones, title: "iPhone 11", subtitle: "A13 - Purple", price: "$499", productImage: "iPhone11"),
		Product(type: .Phones, title: "iPhone SE 2", subtitle: "A13 - White", price: "$399", productImage: "iPhoneSE"),
		Product(type: .Tablets, title: "iPad Pro", subtitle: "M1 - Silver", price: "$999", productImage: "iPadPro"),
		Product(type: .Tablets, title: "iPad Air 4", subtitle: "A14 - Pink", price: "$699", productImage: "iPadAir"),
		Product(type: .Tablets, title: "iPad Mini", subtitle: "A15 - Grey", price: "$599", productImage: "iPadMini"),
		Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 6: Red", price: "$359",productImage: "AppleWatch6"),
		Product(type: .Wearable, title: "Samsung Watch", subtitle: "Gear: Black", price: "$180", productImage: "SamsungWatch"),
		Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 4: Black", price: "$250", productImage: "AppleWatch4"),
		Product(type: .Laptops, title: "MacBook Air", subtitle: "M1 - Gold", price: "$999", productImage: "MacBookAir"),
		Product(type: .Laptops, title: "MacBook Pro", subtitle: "M1 - Space Grey", price: "$1299", productImage: "MacBookPro"),
		Product(type: .Laptops, title: "iMac", subtitle: "M1 - Purple", price: "$1599", productImage: "iMac"),
	]
	
	// Filtered Products..
	@Published var filteredProducts: [Product] = []
	
	// More products on the type..
	@Published var showMoreProductsOnType: Bool = false
	
	// Search Data..
	@Published var searchText: String = ""
	@Published var searchActivated: Bool = false
	@Published var searchedProducts: [Product]?
	
	var searchCancellable: Any?
	
	init() {
		filterProductByType()
		
		searchCancellable = $searchText.removeDuplicates()
			.debounce(for: 0.5, scheduler: RunLoop.main)
			.sink(receiveValue: { str in
				if str != ""{
					self.filterProductBySearch()
				} else {
					self.searchedProducts = nil
				}
			})
	}
	
	
	// MARK: -  FUNCTION
	
	func filterProductByType() {
		// Filtering product By Product Type..
		DispatchQueue.global(qos: .userInteractive).async {
			
			let results = self.products
			// Since it will require more momory so were using lazy to perform more..
				.lazy
				.filter { product in
					return product.type == self.productType
				}
			// Limiting result
				.prefix(4)
			
			DispatchQueue.main.async {
				self.filteredProducts = results.compactMap({ product in
					return product
				})
			}
		}
	}
	
	func filterProductBySearch() {
		// Filtering product By Product Type..
		DispatchQueue.global(qos: .userInteractive).async {
			
			let results = self.products
			// Since it will require more momory so were using lazy to perform more..
				.lazy
				.filter { product in
					return product.title.lowercased().contains(self.searchText.lowercased())
				}
			
			DispatchQueue.main.async {
				self.searchedProducts = results.compactMap({ product in
					return product
				})
			}
		}
	}
}
