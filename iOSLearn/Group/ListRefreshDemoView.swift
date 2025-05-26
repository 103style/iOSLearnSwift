//
//  ListRefreshDemoView.swift
//  iOSLearn
//
//  Created by kempluo on 2025/5/26.
//

import SwiftUI

struct ListRefreshDemoView: View {
    @Environment(GroupApplicationData.self) private var shareData

    var body: some View {
        List(shareData.books) { book in
            CellBook(book: book)
        }
        .listStyle(.plain)
        .refreshable {
            print("refreshing")
        }
    }
}

#Preview {
    ListRefreshDemoView()
        .environment(GroupApplicationData.shared)
}
