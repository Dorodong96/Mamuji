//
//  MamujiApp.swift
//  Mamuji
//
//  Created by DongKyu Kim on 2022/04/30.
//

import SwiftUI

@main
struct MamujiApp: App {
    init() {
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}
