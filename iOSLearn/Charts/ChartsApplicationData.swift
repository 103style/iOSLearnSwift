//
//  ChartsApplicationData.swift
//  iOSLearn
//
//  Created by kempluo on 2025/6/18.
//

import Observation
import SwiftUI

struct Consumables: Identifiable {
    let id = UUID()
    var name: String
    var category: String
    var calories: Int
}

@Observable class ChartsApplicationData {
    var listOfItems: [Consumables]

    static let shared: ChartsApplicationData = .init()

    private init() {
        listOfItems = [
            Consumables(name: "Bagels", category: "Baked", calories: 250),
            Consumables(name: "Brownies", category: "Baked", calories: 466),
            Consumables(name: "Butter", category: "Dairy", calories: 717),
            Consumables(name: "Cheese", category: "Dairy", calories: 402),
            Consumables(name: "Cookies", category: "Baked", calories: 502),
            Consumables(name: "Donuts", category: "Baked", calories: 452),
            Consumables(name: "Granola", category: "Baked", calories: 471),
        ]
    }
}
