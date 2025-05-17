import UIKit
import Foundation

// 日期操作

var curData = Date() // 此时
var nextDay = Date(timeIntervalSinceNow: 24 * 60 * 60) // 明天这个时候
var tendaysAgo = Date(timeInterval: -10 * 24 * 60 * 60, since:nextDay) // 10天前的这个时候


// -------


var days = 7
var today = Date()
var event = Date(timeIntervalSinceNow: Double(days) * 24 * 3600)
if today.compare(event) == .orderedAscending {
    let interval = event.timeIntervalSince(today)
    print("We have to wait \(interval) seconds")
}

// ------

// 获取当前的年月日
let calendar = Calendar.current
var components = calendar.dateComponents([.year,.month,.day], from: today)
print("The year is \(components.year)")
print("The month is \(components.month)")
print("The day is \(components.day)")


// 创建一个新的日期
let id = Calendar.Identifier.gregorian // 公历
let calendar2 = Calendar(identifier: id)
var comp = DateComponents()
comp.year = 1970
comp.month = 8
comp.day = 21
var birth = calendar2.date(from: comp) // "21 Aug 1970 at 12:00 AM"

// 100天之后
var comp2 = DateComponents()
comp2.day = 120
var appointent = calendar2.date(byAdding: comp2, to: today) // "14 Sep 2025 at 7:19 PM"


// 计算从出生到现在过了多少天
var comp3 = DateComponents()
comp3.year = 1990
comp3.month = 5
comp3.day = 17

var brithday = calendar2.date(from: comp3)
if let olddate = brithday {
    let comps = calendar2.dateComponents([.day], from: olddate, to: today)
    print("days betweens dates:\(comps.day)")
}


// 计算今天是不是在一个日期区间内
var compontStart = DateComponents()
compontStart.year  = 1970
compontStart.month  = 5
compontStart.day  = 17
let startDate = calendar2.date(from: compontStart)

var compontFuture = DateComponents()
compontFuture.year  = 2130
compontFuture.month  = 5
compontFuture.day  = 17
let futureDate = calendar2.date(from: compontFuture)

if startDate != nil && futureDate != nil {
    let interval = DateInterval(start: startDate!, end: futureDate!)
    if interval.contains(today){
        print("you still have time")
    }
}

// -----------

// 日期格式化
// 获取当天是星期几
var now = Date.now
var text = now.formatted(.dateTime.weekday(.wide))
print(text) // Saturday
text = now.formatted(.dateTime.day().hour().month(.wide))
print(text) // 17 May at 7 PM

// 中国的格式
var local = Locale(identifier: "zh_CN")
text = now.formatted(.dateTime.locale(local).day().year().month(.wide))
print(text) // 2025年5月17日

// 设置不同的时区

// 计算不同时区的当前时分秒
if let tokyoTimeZone = TimeZone(identifier: "Asia/Tokyo"), let madridTimeZone = TimeZone(identifier: "Europe/Madrid"){
    let now = Date.now
    let time = now.formatted(.dateTime.locale(local).hour().minute().second())
    
    var dateTimeStyle = Date.FormatStyle()
    dateTimeStyle.timeZone = tokyoTimeZone
    let tokyoTime = now.formatted(dateTimeStyle.hour().minute().second())
    
    dateTimeStyle.timeZone = madridTimeZone
    let madridTime = now.formatted(dateTimeStyle.hour().minute().second())
    
    print("my local time is : \(time)")
    print("tokyoTime  is : \(tokyoTime)")
    print("madridTime  is : \(madridTime)")
}

