//
//  tic_tac_toeApp.swift
//  tic_tac_toe WatchKit Extension
//
//  Created by 曹紫光 on 2022/6/27.
//

import SwiftUI

@main
struct tic_tac_toeApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
