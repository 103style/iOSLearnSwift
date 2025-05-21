//
//  GridsDemoView.swift
//  iOSLearn
//
//  Created by kempluo on 2025/5/20.
//

import SwiftUI

struct GridsDemoView: View {
    var body: some View {
        // 默认 有标准间距（8）并居中对齐
        Grid {
            GridRow {
                Image(systemName: "figure.walk.circle").frame(width: 100, height: 100)
                Image(systemName: "figure.wave.circle").frame(width: 100, height: 100)
            }.background(Color.red)
            GridRow {
                Text("Map")
            }.gridCellColumns(2) // 一个View占两列
            GridRow {
                Image(systemName: "location.circle").frame(width: 100, height: 100)
                Image(systemName: "location.north.circle").frame(width: 100, height: 100)
            }.background(Color.blue)
        }.font(.largeTitle)

        Grid {
            GridRow {
                Image(systemName: "figure.walk.circle").frame(width: 100, height: 100)
                    .background(Color.blue)
                Grid {
                    GridRow {
                        Text("Row")
                    }
                    GridRow {
                        Text("Row")
                    }
                }
            }
        }.font(.largeTitle)
    }
}

#Preview {
    GridsDemoView()
}
