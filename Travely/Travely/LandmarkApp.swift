//
//  LandmarkApp.swift
//  Travely
//
//  Created by 장서영 on 2022/03/30.
//

import SwiftUI

struct LandmarkApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
