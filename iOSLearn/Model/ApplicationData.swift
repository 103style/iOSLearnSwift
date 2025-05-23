//
//  ApplicationData.swift
//  iOSLearn
//
//  Created by kempluo on 2025/5/22.
//

import Foundation
import SwiftUI

@Observable class ApplicationData: @unchecked Sendable {
    var title: String = "App Name"
    var titleInput: String = ""

    static let shared: ApplicationData = .init()

    private init() {}
}
