//
//  FoodStorageManage.swift
//  iOSLearn
//
//  Created by kempluo on 2025/6/16.
//

import Foundation
import SwiftUI

@Observable class FoodStorageManage: @unchecked Sendable {
    
    var viewPath = NavigationPath()
    
    static let shared: FoodStorageManage = .init()
    
    private init() {}
}
