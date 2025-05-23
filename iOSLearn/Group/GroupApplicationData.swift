//
//  GroupApplicationData.swift
//  iOSLearn
//
//  Created by kempluo on 2025/5/23.
//

import Foundation
import SwiftUI

struct Book: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var author: String
    var cover: String
    var year: Int
    var selected: Bool

    var displayYear: String {
        return String(year)
    }
}

@Observable class GroupApplicationData: @unchecked Sendable {
    var books: [Book] = []

    static let shared: GroupApplicationData = .init()

    private init() {
        books = [
            Book(title: "Kotlin", author: "KKK", cover: "k.circle", year: 20023, selected: false),
            Book(title: "Swift", author: "SSS", cover: "s.circle", year: 20025, selected: false),
            Book(title: "iOS", author: "III", cover: "i.circle", year: 20024, selected: false),
            Book(title: "Android", author: "AAA", cover: "a.circle", year: 2022, selected: false),
            Book(title: "C", author: "CCC", cover: "c.circle", year: 2022, selected: false),
            Book(title: "C++", author: "CCC", cover: "c.circle", year: 20023, selected: false),
            Book(title: "Golang", author: "GGG", cover: "g.circle", year: 20024, selected: false),
            Book(title: "Java", author: "JJJ", cover: "j.circle", year: 20025, selected: false),
            Book(title: "Ruby", author: "RRR", cover: "r.circle", year: 20025, selected: false),
            Book(title: "R", author: "RRR", cover: "r.circle", year: 20025, selected: false),
            Book(title: "Python", author: "PPP", cover: "p.circle", year: 20025, selected: false),
            Book(title: "PHP", author: "PPP", cover: "p.circle", year: 20025, selected: false),
        ]
    }
}
