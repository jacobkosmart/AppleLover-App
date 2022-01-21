//
//  ContentView.swift
//  Shared
//
//  Created by Jacob Ko on 2022/01/20.
//

import SwiftUI

struct ContentView: View {
	
	// Log Status..
	@AppStorage("logStatus") var logStatus: Bool = false
	
	var body: some View {
		Group {
			if logStatus {
				MainPage()
			} else {
				OnBoardingView()
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
