//
//  Food.swift
//  iOSLearn
//
//  Created by kempluo on 2025/6/16.
//

import SwiftData
import SwiftUI

// @Model 宏是 SwiftData 框架的核心，用于定义数据模型。
// 它简化了 Core Data 的使用，通过宏自动生成代码，实现对象关系映射（ORM）。

// @Model 宏自动实现的功能
// 1.​​持久化能力
// 自动使类遵循 PersistentModel 协议
// 自动生成 schema（数据模型结构）
//
// 2.​​属性处理
// 所有存储属性默认持久化
// 使用 @Transient 声明不持久化的属性：
//
// 3.​​关系管理
// 自动处理一对多、多对一关系
// 通过 @Relationship 控制级联删除：
// @Relationship(.cascade) // 删除书时自动删除关联书评
// var reviews: [Review] = []
//
// 4.​​唯一标识符

// 高级配置选项
// 1.自定义主键 (Unique Constraints)
//  @Model(uniqueConstraints: [
//      UniqueConstraint(\.isbn) // 设置ISBN为唯一约束
//  ])

@Model
class Food: Identifiable {
    #Unique<Food>([\.name, \.price, \.cover])

    @Attribute(.unique) var id: UUID = UUID()
    var name: String = ""
    var price: Double = 0.0
    var cover: String = ""

    init(name: String, price: Double, cover: String) {
        self.name = name
        self.price = price
        self.cover = cover
    }

    @Transient var coverUrl: URL? {
        return cover == nil || cover.isEmpty ? nil : URL(string: cover)
    }

    @Transient var displayPrice: String {
        let value = price > 0 ? String(price) : "For free"
        return value
    }
}
