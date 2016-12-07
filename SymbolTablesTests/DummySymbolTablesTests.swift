//
//  DummySymbolTablesTests.swift
//  SymbolTables
//
//  Created by Vincent O'Sullivan on 07/12/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import XCTest

class DummySymbolTablesTests: XCTestCase {

    let keys = "SEARCHEXAMPLE".characters.map { String($0) }
    //let dummySymbolTable = DummySymbolTable()

    override func setUp() {
        super.setUp()
        var value = 0
        for key in keys {
            //dummySymbolTable.put(key: key, value: value)
        }
//        for key in dummySymbolTable.keys() {
//            print(key, dummySymbolTable.get(key: key))
//        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
