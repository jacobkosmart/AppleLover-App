//
//  Product.swift
//  EcommerceApple (iOS)
//
//  Created by Jacob Ko on 2022/01/21.
//

import SwiftUI

// Product Model..
struct Product: Identifiable, Hashable {
	var id = UUID().uuidString
	var type: ProductType
	var title: String
	var subtitle: String
	var description: String = ""
	var price: String
	var productImage: String = ""
	var quantity: Int = 1
}


// Product Types..
enum ProductType: String, CaseIterable {
	case Phones = "Phones"
	case Tablets = "Tablets"
	case Wearable = "Wearable"
	case Laptops = "Laptops"
}

