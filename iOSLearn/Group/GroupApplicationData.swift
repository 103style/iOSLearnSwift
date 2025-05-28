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

struct ExpandData: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var childs: [ExpandData]!
}

@Observable class GroupApplicationData: @unchecked Sendable {
    var books: [Book] = []

    var expandDatas: [ExpandData] = []

    var filterBooks: [Book] = []

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

        expandDatas = [
            ExpandData(title: "Android", childs: [
                ExpandData(title: "Kotlin", childs: nil),
                ExpandData(title: "Java", childs: nil),
                ExpandData(title: "Compsose", childs: nil),
                ExpandData(title: "Gradle", childs: [
                    ExpandData(title: "Groovy", childs: nil),
                    ExpandData(title: "Kotlin", childs: nil),
                ]),
            ]),
            ExpandData(title: "iOS", childs: [
                ExpandData(title: "Swift", childs: nil),
                ExpandData(title: "Object-C", childs: nil),
            ]),
        ]
        filter(keyword: "")
    }

    func filter(keyword: String) {
        filterBooks = if keyword.isEmpty {
            books.sorted(by: { $0.title < $1.title })
        } else {
            books.filter { item in
                item.title.localizedStandardContains(keyword)
            }
        }
    }
}
