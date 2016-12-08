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
    let tinyText = "it was the best of times it was the worst of times" +
        "it was the age of wisdom it was the age of foolishness" +
        "it was the epoch of belief it was the epoch of incredulity" +
        "it was the season of light it was the season of darkness" +
        "it was the spring of hope it was the winter of despair"
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

//    func testPerformance() {
//        let words = read(filename: "TinyTale.txt")
//        let minimumLength = 8
//        for word in words {
//            if word.characters.count <= minimumLength {
//                if dummySymbolTable.contains(key: word) {
//                    dummySymbolTable.put(key: word, value: 1 + dummySymbolTable.get(key: key))
//                } else {
//                    dummySymbolTable.put(key: word, value: 1)
//                }
//            }
//            // Find a key with the highest frequency count.
//            var maxKey   = ""
//            var maxCount = 0
//            for word in dummySymbolTable.keys() {
//                let wordCount = dummySymbolTable.get(key: word) ?? 0
//                if wordCount > maxCount {
//                    maxKey   = word
//                    maxCount = wordCount
//                }
//            }
//            print("Most frequent word: \(maxKey) (\(maxCount)).")
//        }
//    }

    func read(filename: String) -> [String] {

        let name = filename.components(separatedBy: ".")
        let path = Bundle.main.path(forResource: name[0], ofType: name[1])
        let text = try! String(contentsOfFile: path!)
        return text.components(separatedBy: CharacterSet(charactersIn: " \n"))
    }
}
