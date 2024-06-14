//
//  MVIApp.swift
//  MVI
//
//  Created by Eldiiar on 8/5/24.
//

import SwiftUI

@main
struct MVIApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                SignInView()
            }
        }
    }
}
