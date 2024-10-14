//
//  YNU_TokiwaApp.swift
//  YNU_Tokiwa
//
//  Created by 林　一貴 on 2024/10/04.
//

import SwiftUI

@main
struct YNU_TokiwaApp: App {
    @AppStorage("UItheme") var UItheme: isDarkMode = .phone
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(UItheme.colorScheme ?? .none)
//                .preferredColorScheme(nil)
        }
    }
}
