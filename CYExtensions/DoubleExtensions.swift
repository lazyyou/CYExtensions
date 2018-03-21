//
//  DoubleExtensions.swift
//  CYExtensions
//
//  Created by  阿友哥 on 2018/3/21.
//  Copyright © 2018年  阿友哥. All rights reserved.
//

#if os(OSX)
    import AppKit
#endif

#if os(iOS) || os(tvOS)
    import UIKit
#endif

extension Double {
    
    public func digits() -> (integral: [Int], decimal: [Int]) {
        var integral = self
        var integralDigits: [Int] = [] // 整数部分
        while integral >= 1 {
            let digit = Int(integral - floor(integral / 10.0) * 10)
            integral = integral / 10
            integralDigits.insert(digit, at: 0)
        }
                
        /// 数值必须小于100兆亿（1亿亿），数据类型由小数方式变为指数
        guard self < pow(10, 16) else { return (integralDigits, []) }
        
        let digitsStrArr = NSNumber(value: self).stringValue.split(separator: ".") // 转化为字符串，限制小数长度
        var decimalDigits: [Int] = [] // 小数部分
        for (index, digitsStr) in digitsStrArr.enumerated() {
            for digitStr in digitsStr {
                if let digit = NumberFormatter().number(from: String(digitStr)) {
                    index == 0 ? () : decimalDigits.append(digit.intValue)
                }
            }
        }
        
        return (integralDigits, decimalDigits)
    }
    
    /**
     1. 获取数字数组
     2. 将数组拼接成中文数字字符串
     3. 相邻的多个零保留最后一个零，前面的替换成占位符
     4. 添加单位
     5. 去除占位符
     
     注：double型有效位数为16位，所以精度是16位
     */
    public func toChineseNumeral(isLowercase: Bool = true, seperater: String = "点") -> String {
        
        let lowercaseNumeral =  [0: "零", 1: "一", 2: "二", 3: "三", 4: "四", 5: "五", 6: "六", 7: "七", 8: "八", 9: "九"]
        let uppercaseNumeral =  [0: "零", 1: "壹", 2: "贰", 3: "叁", 4: "肆", 5: "伍", 6: "陆", 7: "柒", 8: "捌", 9: "玖"]
        
        let lowercaseBenchmarkUnit = ["", "十", "百", "千"]
        let uppercaseBenchmarkUnit = ["", "拾", "佰", "仟"]
        
        let numeral = isLowercase ? lowercaseNumeral : uppercaseNumeral
        let benchmarkUnit = isLowercase ? lowercaseBenchmarkUnit : uppercaseBenchmarkUnit
        let unit = ["", "万", "亿", "万亿", "亿亿"]
        let placeholder = "P"
        
        let (integral, decimal) = digits()
        // 2. 将数组拼接成中文数字字符串
        var integralNumeral: String = "" // 整数部分数字
        for digit in integral {
            integralNumeral += numeral[digit]!
        }
        
        var newIntegralNumeral: String = ""
        // 3. 相邻的多个零保留最后一个零，前面的替换成占位符
        var previousDigit = numeral[0]
        var fourDigit = ""
        for (index, digitStr) in integralNumeral.reversed().enumerated() {
            let digit = String(digitStr)
            
            var newDigit = ""
            // 如果上一个数字等于零，并且当前数字是零
            if previousDigit == numeral[0] && digit == numeral[0] {
                newDigit = placeholder
            } else if digit != numeral[0] {
                newDigit = digit + benchmarkUnit[index % 4] // 如果不是占位符，添加标准单位
            } else {
                newDigit = digit
            }
            
            fourDigit = newDigit + fourDigit
            // 4. 添加单位
            if (index + 1) % 4 == 0 || (index + 1) == integralNumeral.count { // 如果是4的倍数或者最后一位数字，添加单位
                if fourDigit != "PPPP" && fourDigit != "PPP零" { // 四位数字不全为零
                    let i = ceil(Double(index + 1) / 4 - 1)
                    newIntegralNumeral = fourDigit + unit[Int(i)] + newIntegralNumeral
                } else {
                    newIntegralNumeral = fourDigit + newIntegralNumeral
                }
                
                fourDigit = ""
            }
            
            previousDigit = digit
        }
        
        // 5. 去除占位符
        newIntegralNumeral = newIntegralNumeral.replacingOccurrences(of: placeholder, with: "")
        newIntegralNumeral = newIntegralNumeral == "" ? "零" : newIntegralNumeral
        
        var decimalNumeral: String = "" // 小数部分数字
        for digit in decimal {
            decimalNumeral += numeral[digit]!
        }
        
        return decimalNumeral == "" ? newIntegralNumeral : newIntegralNumeral + seperater + decimalNumeral
    }
}
