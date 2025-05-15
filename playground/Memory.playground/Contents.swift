import UIKit

class Employee {
    var name: String?
    var location: Department?
}

class Department {
    var area: String?
    var person: Employee?
}

var employee: Employee? = Employee()
var department: Department? = Department()

employee?.name = "John"
employee?.location = department

department?.area = "Mail"
department?.person = employee

// ARC 自动引用计数
// 当出现强引用循环，如上代码 employee 和 department 相互引用

// 所以 swift将引用分为三类来解决相互引用的问题
// 强、弱（weak） 和 无主引用（unowned）
// 非拥有引用：weak（可选）、unowned（非可选）
// weak：解决循环引用问题
// unowned：解决闭包中的非拥有引用

//   特性          weak              unowned
// ​​ 是否可选​​     是（Optional）           否（非可选）
// ​​  安全性​​    自动置 nil，避免崩溃    需手动保证对象存在
// ​​  性能​​      稍低（需要处理可选值）       稍高
// ​​ 适用场景​​     对象可能提前释放       对象生命周期同步

// 总结
// ​​weak​​：安全但稍慢，适用于不确定对象是否存在的场景。
// unowned​​：高效但风险高，适用于对象生命周期严格绑定的场景。
// 关键原则​​：若无法确定对象是否存活，优先使用 weak；若确定对象一定存在，再用 unowned。

// 弱引用示例
class Employee1 {
    var name: String?
    var location: Department1?
}

class Department1 {
    var area: String?
    weak var person: Employee1? // 通过关键字 weak 来申明弱引用
}

var employee1: Employee? = Employee()
var department1: Department? = Department()

employee1?.name = "John"
employee1?.location = department

department1?.area = "Mail"
department1?.person = employee
