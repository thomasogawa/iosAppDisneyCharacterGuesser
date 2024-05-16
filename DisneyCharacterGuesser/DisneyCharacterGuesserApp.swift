//
//  DisneyCharacterGuesserApp.swift
//  DisneyCharacterGuesser
//
//  Created by Thomas Ogawa on 5/15/24.
//

import SwiftUI

@main
struct DisneyCharacterGuesserApp: App {
    init() {
        UITabBar.appearance().backgroundColor = UIColor(rgb: 0xBADAFF)
    }
    var body: some Scene {
        WindowGroup {
            StartScreen()
        }
    }
}
