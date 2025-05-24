//
//  LazyGridDemoView.swift
//  iOSLearn
//
//  Created by kempluo on 2025/5/24.
//

import SwiftUI

struct LazyGridDemoView: View {
    
    @Environment(GroupApplicationData.self) private var shareData
    
//    let guides = [
//        GridItem(.fixed(75)),
//        GridItem(.fixed(75)),
//        GridItem(.fixed(75)),
//    ]
//    
//    let guides = [
//        GridItem(.flexible(minimum: 75), alignment: .top),
//        GridItem(.flexible(minimum: 75), alignment: .top),
//        GridItem(.flexible(minimum: 75), alignment: .top),
//    ]
//    
    
    
    let guides = [
        GridItem(.adaptive(minimum: 75))
    ]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: guides){
                ForEach(shareData.books){ book in
                    Image(systemName: book.cover)
                        .resizable()
                        .scaledToFit()
                }
            }
        }
        
    }
}

#Preview {
    LazyGridDemoView()
        .environment(GroupApplicationData.shared)
}
