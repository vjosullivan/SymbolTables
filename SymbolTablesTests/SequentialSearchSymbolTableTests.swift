//
//  SequentialSearchSymbolTableTests.swift
//  SymbolTables
//
//  Created by Vincent O'Sullivan on 07/12/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import XCTest
@testable import SymbolTables

class SequentialSearchSymbolTableTests: XCTestCase {

    let keys = "SEARCHEXAMPLE".characters.map { String($0) }
    let tinyText = "it was the best of times it was the worst of times" +
        "it was the age of wisdom it was the age of foolishness" +
        "it was the epoch of belief it was the epoch of incredulity" +
        "it was the season of light it was the season of darkness" +
    "it was the spring of hope it was the winter of despair"
    let symbolTable = SequentialSearchSymbolTable()

    override func setUp() {
        super.setUp()
        var value = 0
//        for key in keys {
//            symbolTable.put(key: key, value: value)
//            value += 1
//        }
//        for key in symbolTable.keys() {
//            print(key, symbolTable.get(key: key)!)
//        }
    }

//    func testPerformanceTiny() {
//        let words = read(filename: "TinyTale.txt")
//        let minimumLength = 3
//        for word in words {
//            if word.characters.count >= minimumLength {
//                if symbolTable.contains(key: word) {
//                    symbolTable.put(key: word, value: 1 + symbolTable.get(key: word)!)
//                } else {
//                    symbolTable.put(key: word, value: 1)
//                }
//            }
//        }
//        // Find a key with the highest frequency count.
//        var maxKey   = ""
//        var maxCount = 0
//        for word in symbolTable.keys() {
//            let wordCount = symbolTable.get(key: word) ?? 0
//            if wordCount > maxCount {
//                maxKey   = word
//                maxCount = wordCount
//            }
//        }
//        print("\n\nTinyTale: Most frequent word with a minumum length of \(minimumLength): \(maxKey) (\(maxCount) times).\n\n")
//    }
//
//    func testPerformanceTale() {
//        let words = read(filename: "Tale.txt")
//        let minimumLength = 12
//        var uniqueCount = 0
//        var searchCount = 0
//        print("Starting insertions.")
//        for word in words {
//            if word.characters.count >= minimumLength {
//                searchCount += 1
//                if symbolTable.contains(key: word) {
//                    symbolTable.put(key: word, value: 1 + symbolTable.get(key: word)!)
//                } else {
//                    symbolTable.put(key: word, value: 1)
//                    uniqueCount += 1
//                }
//            }
//        }
//        print("Completed \(uniqueCount) insertions from \(searchCount) searches.")
//        // Find a key with the highest frequency count.
//        var maxKey   = ""
//        var maxCount = 0
//        for word in symbolTable.keys() {
//            let wordCount = symbolTable.get(key: word) ?? 0
//            if wordCount > maxCount {
//                maxKey   = word
//                maxCount = wordCount
//            }
//        }
//        print("\n\nTale: Most frequent word with a minumum length of \(minimumLength): \(maxKey) (\(maxCount) times).\n\n")
//    }

    func read(filename: String) -> [String] {

        let name = filename.components(separatedBy: ".")
        let path = Bundle.main.path(forResource: name[0], ofType: name[1])
        let text = try! String(contentsOfFile: path!)
        return text.components(separatedBy: CharacterSet(charactersIn: " \n"))
    }
}
