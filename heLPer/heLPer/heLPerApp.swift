//
//  heLPerApp.swift
//  heLPer
//
//  Created by Daniel Marsh on 10/11/24.
//

import SwiftUI

@main
struct heLPerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Album.self])
        }
    }
}
