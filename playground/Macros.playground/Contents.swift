import UIKit

// 宏

// freestanding macros 独立宏 -- 将值插入到表达式， 使用 #关键字
// attached macros     附加宏 -- 修改声明， 使用 @关键字

// 定义宏
// @freestanding(expression)
// @attached(member, names: named(==))

// 独立宏 示例
func showMacros() {
    print("File name: \(#file)")
    print("File path: \(#filePath)")
    print("Line number: \(#line)")
    print("Function name:\(#function)")
}

showMacros()


//   特性             宏（Macros）               函数/泛型
//​​  执行时机​​            编译时展开                运行时调用
//​​ 代码可见性​​   生成的代码对开发者透明（需工具查看）    直接可见
//​​  灵活性​​          可生成任意合法代码            受限于语言语法
//​​   性能​​              无运行时开销              可能有调用开销




//// 定义一个表达式宏（生成平方数）
//@freestanding(expression)
//macro square(_ x: Int) -> Int = #externalMacro(module: "MathMacros", type: "SquareMacro")
//
//// 使用宏
//let num = #square(5)



//// 定义一个成员宏（自动为类添加 Equatable 实现）
//@attached(member, names: named(==))
//macro Equatable() = #externalMacro(module: "EquatableMacros", type: "EquatableMacro")
//
//// 使用宏
//@Equatable
//class Book {
//    var title: String
//}
//// 编译后自动生成 `==` 方法
