//
//  SafeAreaDemoView.swift
//  iOSLearn
//
//  安全区域， 灵动岛， 键盘弹起后 等区域
//
//  Created by kempluo on 2025/5/20.
//

import SwiftUI

struct SafeAreaDemoView: View {
    var body: some View {
        VStack {
            Spacer()

            HStack {
                Image(systemName: "arrowshape.turn.up.left.circle")
                    .font(Font.system(size: 60))

                Text("Ignore Safe Area")

                Spacer()
            }
//            Spacer()
//        }.ignoresSafeArea() // 忽略所有安全区域
//        }.ignoresSafeArea(.container, edges: .bottom) // 忽略底部安全区域, 键盘打开 内容会往上移
        }.safeAreaInset(edge: .bottom, content: { // 在底部安全区域插入布局， 上面的内容则会显示在它上面
            HStack {
                Spacer()

                Text("Important Area").padding()

                Spacer()
            }.background(Color.yellow)
        })
    }
}

#Preview {
    SafeAreaDemoView()
}
