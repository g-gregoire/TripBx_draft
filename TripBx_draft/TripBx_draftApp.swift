//
//  TripBx_draftApp.swift
//  TripBx_draft
//
//  Created by Georges Gregoire on 2022-09-09.
//

import SwiftUI

@main
struct TripBx_draftApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(TripModel())
        }
    }
}
