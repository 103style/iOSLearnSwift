//
//  SFSymbolsDemoView.swift
//  iOSLearn
//
//  SF符号， 可缩放、有不同版本、适配当前字体
//  https://developer.apple.com/sf-symbols/
//
//  Created by kempluo on 2025/5/20.
//

import SwiftUI

struct SFSymbolsDemoView: View {
    var body: some View {
        let myFont = Font.system(size: 64)

        // https://developer.apple.com/sf-symbols/
        
        Image(systemName: "microphone.circle")
            .font(myFont.weight(.semibold))
        
        Image(systemName: "microphone.circle.fill")
            .font(myFont.weight(.semibold))
        
        Image(systemName: "microphone.square")
            .font(myFont.weight(.semibold))
        
        // 符号变体修饰符
        Image(systemName: "microphone.circle")
            .font(myFont.weight(.semibold))
            .symbolVariant(.fill)
        
        // .symbolRenderingMode(SymbolRenderingMode)  hierachical、monochrome(default)、multicolor、palette
        // .imageScale(Scale) small、medium、large
        Image(systemName: "square.grid.3x1.folder.badge.plus")
            .font(myFont.weight(.semibold))
            .symbolRenderingMode(.multicolor)
        
        Image(systemName: "square.grid.3x1.folder.badge.plus")
            .font(myFont.weight(.semibold))
            .symbolRenderingMode(.palette)
            .foregroundStyle(.red, .blue) // 图标有两种颜色，所以就需要设置两个
            
        // 多状态符号
        // variableValue 0.0, 0.2, 0.4, 0.6, 0.8
        Image(systemName: "dot.radiowaves.forward", variableValue: 0.6)
            .font(myFont.weight(.semibold))
        
        // 文本、符号
        Label("Hello", systemImage: "envelope.circle")
            .font(myFont)
            .labelStyle(.titleAndIcon) // 设置文本和icon的显示模式 automatic、iconOnly、titleAndIcon、titleOnly
            .imageScale(.large) // 再放大图标
    }
}

#Preview {
    SFSymbolsDemoView()
}
