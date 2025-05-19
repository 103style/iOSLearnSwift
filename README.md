https://www.bilibili.com/video/BV1hLE3z2EAy

1. [Variable](https://github.com/103style/iOSLearnSwift/tree/master/playground/Variable.playground)
2. [DataTypes](https://github.com/103style/iOSLearnSwift/tree/master/playground/DataTypes.playground)
3. [ContinueAndBreak](https://github.com/103style/iOSLearnSwift/tree/master/playground/ContinueAndBreak.playground)
4. [Ifelse](https://github.com/103style/iOSLearnSwift/tree/master/playground/Ifelse.playground)
5. [Switch](https://github.com/103style/iOSLearnSwift/tree/master/playground/Switch.playground)
6. [While](https://github.com/103style/iOSLearnSwift/tree/master/playground/While.playground)
7. [Function](https://github.com/103style/iOSLearnSwift/tree/master/playground/Function.playground)
8. [Closures](https://github.com/103style/iOSLearnSwift/tree/master/playground/Closures.playground)
9. [Struct](https://github.com/103style/iOSLearnSwift/tree/master/playground/Struct.playground)
10. [KeyPathAndMethod](https://github.com/103style/iOSLearnSwift/tree/master/playground/KeyPathAndMethod.playground)
11. [CommonStruct](https://github.com/103style/iOSLearnSwift/tree/master/playground/CommonStruct.playground)
12. [Math](https://github.com/103style/iOSLearnSwift/tree/master/playground/Math.playground)
13. [Range](https://github.com/103style/iOSLearnSwift/tree/master/playground/Range.playground)
14. [String](https://github.com/103style/iOSLearnSwift/tree/master/playground/String.playground)
15. [Array](https://github.com/103style/iOSLearnSwift/tree/master/playground/Array.playground)
16. [Collection](https://github.com/103style/iOSLearnSwift/tree/master/playground/Collection.playground)
17. [Enum](https://github.com/103style/iOSLearnSwift/tree/master/playground/Enum.playground)
18. [Object](https://github.com/103style/iOSLearnSwift/tree/master/playground/Object.playground)
    ```
    // Employee是结构体时， e1 和 e2 ​​是两个独立的对象​​（赋值时复制值）。
    // Employee是类时， e1 和 e2 ​​指向同一个对象​​（赋值时传递的是引用，不是副本）
    var e1 = Employee()
    var e2 = e1
    ```
    ![结构体和类的区别](https://github.com/user-attachments/assets/ea212bb7-1590-4e3f-948b-bfd7be048ee2)
19. [Memory](https://github.com/103style/iOSLearnSwift/tree/master/playground/Memory.playground)
20. [Protocols](https://github.com/103style/iOSLearnSwift/tree/master/playground/Protocols.playground)

    |  特性   | Swift 的 protocol | Java 的 interface |
    |  ----  | ----  | ---- | 
    | 属性要求​​   | 可以定义属性（var/let），指定读写权限 |  只能定义常量（public static final），方法默认 public abstract |
    | 默认实现  | 支持通过 extension 提供默认实现 | Java 8+ 支持 default 方法实现 |
    | 多继承 | 一个类型可遵循多个 protocol | 类只能单继承，但可实现多个 interface |
    | 关联类型 | 支持（associatedtype） | 通过泛型模拟（如 Comparable<T>） |
    | 值类型支持 | 结构体（struct）、枚举（enum）均可遵循 | 仅类（class）可实现接口 |
    | 可选方法 | 通过 @objc 和 optional 标记（仅限于类） | Java 8+ 可用 default 方法变相实现 |

    ![Protocols](https://github.com/user-attachments/assets/c4b94495-66ea-4f5d-922f-19fa306702ea)
21. [Extension](https://github.com/103style/iOSLearnSwift/tree/master/playground/Extension.playground)
22. [Delegates](https://github.com/103style/iOSLearnSwift/tree/master/playground/Delegates.playground)
23. [Error](https://github.com/103style/iOSLearnSwift/tree/master/playground/Error.playground)
    ```
    mutating func sold(amount: Int) throws -> Int {
        if amount > total {
            throw Errors.OutOfStock
        } else {
            total -= amount
        }
        return total
    }

    do {
        try stock.sold(amount: 8)
        // 不关心异常信息时
    } catch Errors.OutOfStock {
        print("do not have enough lamps")
    }
    ```
24. [PropertyWrapper](https://github.com/103style/iOSLearnSwift/tree/master/playground/PropertyWrapper.playground)
25. [Macros](https://github.com/103style/iOSLearnSwift/tree/master/playground/Macros.playground)
26. [NSString](https://github.com/103style/iOSLearnSwift/tree/master/playground/NSString.playground)
27. [Date](https://github.com/103style/iOSLearnSwift/tree/master/playground/Date.playground)
28. [Mearsurements](https://github.com/103style/iOSLearnSwift/tree/master/playground/Mearsurements.playground)
29. [Timer](https://github.com/103style/iOSLearnSwift/tree/master/playground/Timer.playground)
30. [Expressions](https://github.com/103style/iOSLearnSwift/tree/master/playground/Expressions.playground)
31. [OpaqueType](https://github.com/103style/iOSLearnSwift/tree/master/playground/OpaqueType.playground)
