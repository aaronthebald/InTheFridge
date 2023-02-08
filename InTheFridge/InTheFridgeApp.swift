//
//  InTheFridgeApp.swift
//  InTheFridge
//
//  Created by Aaron Wilson on 1/29/23.
//

import SwiftUI

@main
struct InTheFridgeApp: App {
    
    @StateObject private var vm = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabViewConcept1()
                .environmentObject(vm)
        }
    }
}
