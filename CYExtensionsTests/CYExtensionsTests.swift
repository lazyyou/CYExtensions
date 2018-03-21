//
//  CYExtensionsTests.swift
//  CYExtensionsTests
//
//  Created by  阿友哥 on 2018/3/21.
//  Copyright © 2018年  阿友哥. All rights reserved.
//

import XCTest
@testable import CYExtensions

class CYExtensionsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDigits() {
//        XCTAssertEqual(Double(1.0).digits(), ([1], []))
//        XCTAssertEqual(Double(12.0).digits(), ([1, 2], []))
//        XCTAssertEqual(Double(103.0).digits(), ([1, 0, 3], []))
//        XCTAssertEqual(Double(1.230).digits(), ([1], [2, 3]))
//        XCTAssertEqual(Double(1.0345).digits(), ([1], [0, 3, 4, 5]))
    }
    
    func testExample() {
        XCTAssertEqual(Double(0.0).toChineseNumeral(), "零")
        XCTAssertEqual(Double(1.0).toChineseNumeral(), "一")
        XCTAssertEqual(Double(10.0).toChineseNumeral(), "一十")
        XCTAssertEqual(Double(100.0).toChineseNumeral(), "一百")
        XCTAssertEqual(Double(1000.0).toChineseNumeral(), "一千")
        XCTAssertEqual(Double(10000.0).toChineseNumeral(), "一万")
        XCTAssertEqual(Double(100000.0).toChineseNumeral(), "一十万")
        
        XCTAssertEqual(Double(0.1).toChineseNumeral(), "零点一")
        XCTAssertEqual(Double(0.12).toChineseNumeral(), "零点一二")
        XCTAssertEqual(Double(0.123).toChineseNumeral(), "零点一二三")
        XCTAssertEqual(Double(0.1234).toChineseNumeral(), "零点一二三四")
        XCTAssertEqual(Double(0.12345).toChineseNumeral(), "零点一二三四五")
        XCTAssertEqual(Double(0.123456).toChineseNumeral(), "零点一二三四五六")

        XCTAssertEqual(Double(12.0).toChineseNumeral(), "一十二")
        XCTAssertEqual(Double(123.0).toChineseNumeral(), "一百二十三")
        XCTAssertEqual(Double(1234.0).toChineseNumeral(), "一千二百三十四")
        XCTAssertEqual(Double(12345.0).toChineseNumeral(), "一万二千三百四十五")
        XCTAssertEqual(Double(123456.0).toChineseNumeral(), "一十二万三千四百五十六")
        
        XCTAssertEqual(Double(101).toChineseNumeral(), "一百零一")
        XCTAssertEqual(Double(1001).toChineseNumeral(), "一千零一")
        XCTAssertEqual(Double(10001).toChineseNumeral(), "一万零一")
        XCTAssertEqual(Double(100001).toChineseNumeral(), "一十万零一")
        XCTAssertEqual(Double(1000001).toChineseNumeral(), "一百万零一")
        XCTAssertEqual(Double(10000001).toChineseNumeral(), "一千万零一")
        XCTAssertEqual(Double(100000001).toChineseNumeral(), "一亿零一")
        
        // 有效位数为16位
        XCTAssertEqual(Double(1234567890123456.0).toChineseNumeral(), "一千二百三十四万亿五千六百七十八亿九千零一十二万三千四百五十六")
        XCTAssertEqual(Double(12345678901234567.0).toChineseNumeral(), "一亿亿二千三百四十五万亿六千七百八十九亿零一百二十三万四千五百六十八")
        XCTAssertEqual(Double(123456789012345678.0).toChineseNumeral(), "一十二亿亿三千四百五十六万亿七千八百九十零亿一千二百三十四万五千六百八十")
        XCTAssertEqual(Double(1234567890123456789.0).toChineseNumeral(), "一百二十三亿亿四千五百六十七万亿八千九百零一亿二千三百四十五万六千八百")
        XCTAssertEqual(Double(12345678901234567890.0).toChineseNumeral(), "一千二百三十四亿亿五千六百七十八万亿九千零一十二亿三千四百五十六万八千")

        XCTAssertEqual(Double(1234567890.123456).toChineseNumeral(), "一十二亿三千四百五十六万七千八百九十点一二三四五六")
        XCTAssertEqual(Double(1234567890.1234567).toChineseNumeral(), "一十二亿三千四百五十六万七千八百九十点一二三四五七")
        XCTAssertEqual(Double(1234567890.12345678).toChineseNumeral(), "一十二亿三千四百五十六万七千八百九十点一二三四五七")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
