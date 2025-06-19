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

struct Sales: Identifiable {
    let id = UUID()
    var date: Date
    var amount: Int
}

struct Products: Identifiable {
    let id = UUID()
    var name: String
    var sales: [Sales]
}

@Observable class ChartsApplicationData {
    var listOfItems: [Consumables]

    var sales: [Products]

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

        let salesBagels = [
            Sales(date: Date(timeInterval: -86400 * 7, since: Date()), amount: 10),
            Sales(date: Date(timeInterval: -86400 * 6, since: Date()), amount: 12),
            Sales(date: Date(timeInterval: -86400 * 5, since: Date()), amount: 8),
            Sales(date: Date(timeInterval: -86400 * 4, since: Date()), amount: 13),
            Sales(date: Date(timeInterval: -86400 * 3, since: Date()), amount: 9),
            Sales(date: Date(timeInterval: -86400 * 2, since: Date()), amount: 7),
            Sales(date: Date(timeInterval: -86400 * 1, since: Date()), amount: 8),
        ]

        let salesBrownies = [
            Sales(date: Date(timeInterval: -86400 * 7, since: Date()), amount: 3),
            Sales(date: Date(timeInterval: -86400 * 6, since: Date()), amount: 5),
            Sales(date: Date(timeInterval: -86400 * 5, since: Date()), amount: 2),
            Sales(date: Date(timeInterval: -86400 * 4, since: Date()), amount: 8),
            Sales(date: Date(timeInterval: -86400 * 3, since: Date()), amount: 6),
            Sales(date: Date(timeInterval: -86400 * 2, since: Date()), amount: 5),
            Sales(date: Date(timeInterval: -86400 * 1, since: Date()), amount: 9),
        ]
        sales = [
            Products(name: "Bagels", sales: salesBagels),
            Products(name: "Brownies", sales: salesBrownies),
        ]
    }
}
