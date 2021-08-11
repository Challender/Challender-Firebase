//
//  ChallenderApp.swift
//  Challender
//
//  Created by gibeom on 2021/08/10.
//

import SwiftUI
import Firebase

@main
struct ChallenderApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
