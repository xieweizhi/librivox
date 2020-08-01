//
//  librivoxApp.swift
//  Shared
//
//  Created by weizhi.
//

import SwiftUI

@main
struct librivoxApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: BookListViewModel())
        }
    }
}
