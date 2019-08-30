//
//  PlayLocalVideoTests.swift
//  PlayLocalVideoTests
//
//  Created by Nanthakumaran.
//  Copyright © 2019 Nanthakumaran. All rights reserved.
//

import XCTest

class PlayLocalVideoTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let path1 = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let path2 = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!

        guard path1.absoluteString == path2 else {
            print("Not the Same")
            return
        }
        print("Not different")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
