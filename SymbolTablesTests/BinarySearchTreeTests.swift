//
//  BinarySearchTreeTests.swift
//  SymbolTables
//
//  Created by Vincent O'Sullivan on 10/12/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import XCTest
@testable import SymbolTables

class BinarySearchTreeTests: XCTestCase {

    let tinyText = "it was the best of times it was the worst of times" +
        "it was the age of wisdom it was the age of foolishness" +
        "it was the epoch of belief it was the epoch of incredulity" +
        "it was the season of light it was the season of darkness" +
    "it was the spring of hope it was the winter of despair"
    let symbolTable = BinarySearchTree()

    override func setUp() {
        super.setUp()
        symbolTable.clear()
    }

    func testWriteReadOnce() {
        symbolTable.put(key: "D", value: 4)
        XCTAssertEqual(4, symbolTable.get(key: "D"))
    }

    func testWriteReadTwice() {
        symbolTable.put(key: "D", value: 4)
        symbolTable.put(key: "B", value: 2)
        XCTAssertEqual(4, symbolTable.get(key: "D"))
        XCTAssertEqual(2, symbolTable.get(key: "B"))
    }

    func testReadKeyNotPresent() {
        symbolTable.put(key: "D", value: 4)
        symbolTable.put(key: "B", value: 2)
        XCTAssertNil(symbolTable.get(key: "X"))
    }

    func testEmptyMin() {
        XCTAssertNil(symbolTable.min())
    }

    func testSize() {
        XCTAssertEqual(0, symbolTable.size())
        symbolTable.put(key: "D", value: 4)
        symbolTable.put(key: "B", value: 2)
        symbolTable.put(key: "F", value: 2)
        symbolTable.put(key: "A", value: 1)
        XCTAssertEqual(4, symbolTable.size())
    }

    func testMin() {
        symbolTable.put(key: "D", value: 4)
        symbolTable.put(key: "B", value: 2)
        symbolTable.put(key: "F", value: 2)
        symbolTable.put(key: "A", value: 1)
        XCTAssertEqual("A", symbolTable.min())
    }

    func testEmptyMax() {
        XCTAssertNil(symbolTable.max())
    }

    func testMax() {
        symbolTable.put(key: "D", value: 4)
        symbolTable.put(key: "B", value: 2)
        symbolTable.put(key: "F", value: 2)
        XCTAssertEqual("F", symbolTable.max())
    }

    func testFloor() {
        XCTAssertNil(symbolTable.floor(key: "Empty"))
        symbolTable.put(key: "D", value: 4)
        symbolTable.put(key: "B", value: 2)
        symbolTable.put(key: "F", value: 2)
        XCTAssertNil(symbolTable.floor(key: "A"))
        XCTAssertEqual("B", symbolTable.floor(key: "B"))
        XCTAssertEqual("B", symbolTable.floor(key: "C"))
        XCTAssertEqual("D", symbolTable.floor(key: "D"))
        XCTAssertEqual("D", symbolTable.floor(key: "E"))
        XCTAssertEqual("F", symbolTable.floor(key: "F"))
        XCTAssertEqual("F", symbolTable.floor(key: "G"))
    }

    func testCeiling() {
        XCTAssertNil(symbolTable.ceiling(key: "Empty"))
        symbolTable.put(key: "D", value: 4)
        symbolTable.put(key: "B", value: 2)
        symbolTable.put(key: "F", value: 2)
        XCTAssertEqual("B", symbolTable.ceiling(key: "A"))
        XCTAssertEqual("B", symbolTable.ceiling(key: "B"))
        XCTAssertEqual("D", symbolTable.ceiling(key: "C"))
        XCTAssertEqual("D", symbolTable.ceiling(key: "D"))
        XCTAssertEqual("F", symbolTable.ceiling(key: "E"))
        XCTAssertEqual("F", symbolTable.ceiling(key: "F"))
        XCTAssertNil(symbolTable.ceiling(key: "G"))
    }

    func testSelect() {
        symbolTable.put(key: "D", value: 4)
        symbolTable.put(key: "B", value: 2)
        symbolTable.put(key: "C", value: 2)
        symbolTable.put(key: "F", value: 2)
        XCTAssertNil(symbolTable.select(rank: -1))
        XCTAssertEqual("B", symbolTable.select(rank: 0))
        XCTAssertEqual("C", symbolTable.select(rank: 1))
        XCTAssertEqual("D", symbolTable.select(rank: 2))
        XCTAssertEqual("F", symbolTable.select(rank: 3))
        XCTAssertNil(symbolTable.select(rank: 4))
    }

    func testEmptySelect() {
        XCTAssertNil(symbolTable.select(rank: -1))
        XCTAssertNil(symbolTable.select(rank: 0))
        XCTAssertNil(symbolTable.select(rank: 1))
    }

    func testRank() {
        symbolTable.put(key: "D", value: 4)
        symbolTable.put(key: "B", value: 2)
        symbolTable.put(key: "C", value: 2)
        symbolTable.put(key: "F", value: 2)
        XCTAssertEqual(0, symbolTable.rank(key: "A"))
        XCTAssertEqual(0, symbolTable.rank(key: "B"))
        XCTAssertEqual(1, symbolTable.rank(key: "C"))
        XCTAssertEqual(2, symbolTable.rank(key: "D"))
        XCTAssertEqual(3, symbolTable.rank(key: "E"))
        XCTAssertEqual(3, symbolTable.rank(key: "F"))
        XCTAssertEqual(4, symbolTable.rank(key: "G"))
    }

    func testEmptyRank() {
        XCTAssertEqual(0, symbolTable.rank(key: "Anything"))
    }

    func testDeleteMinEmpty() {
        XCTAssertEqual(0, symbolTable.size())
        symbolTable.deleteMin()
        XCTAssertEqual(0, symbolTable.size())
    }

    func testDeleteMaxEmpty() {
        XCTAssertEqual(0, symbolTable.size())
        symbolTable.deleteMax()
        XCTAssertEqual(0, symbolTable.size())
    }

    func testDelete1() {
        symbolTable.put(key: "D", value: 4)
        symbolTable.put(key: "B", value: 2)
        symbolTable.put(key: "C", value: 3)
        symbolTable.put(key: "F", value: 6)
        XCTAssertEqual(3, symbolTable.get(key: "C"))
        XCTAssertEqual(4, symbolTable.size())
        symbolTable.delete(key: "C")
        XCTAssertNil(symbolTable.get(key: "C"))
        XCTAssertEqual(3, symbolTable.size())
    }

    func testDelete2() {
        symbolTable.put(key: "D", value: 4)
        symbolTable.put(key: "B", value: 2)
        symbolTable.put(key: "C", value: 3)
        symbolTable.put(key: "F", value: 6)
        XCTAssertEqual(2, symbolTable.get(key: "B"))
        XCTAssertEqual(4, symbolTable.size())
        symbolTable.delete(key: "B")
        XCTAssertNil(symbolTable.get(key: "B"))
        XCTAssertEqual(3, symbolTable.size())
    }

    func testDelete3() {
        symbolTable.put(key: "D", value: 4)
        symbolTable.put(key: "B", value: 2)
        symbolTable.put(key: "C", value: 3)
        symbolTable.put(key: "F", value: 6)
        XCTAssertEqual(6, symbolTable.get(key: "F"))
        XCTAssertEqual(4, symbolTable.size())
        symbolTable.delete(key: "F")
        XCTAssertNil(symbolTable.get(key: "F"))
        XCTAssertEqual(3, symbolTable.size())
    }

    func testDelete4() {
        symbolTable.put(key: "D", value: 4)
        symbolTable.put(key: "B", value: 2)
        symbolTable.put(key: "A", value: 1)
        symbolTable.put(key: "C", value: 3)
        symbolTable.put(key: "F", value: 6)
        XCTAssertEqual(2, symbolTable.get(key: "B"))
        XCTAssertEqual(5, symbolTable.size())
        symbolTable.delete(key: "B")
        XCTAssertNil(symbolTable.get(key: "B"))
        XCTAssertEqual(4, symbolTable.size())
    }

    func testDeleteByPut() {
        symbolTable.put(key: "D", value: 4)
        symbolTable.put(key: "B", value: 2)
        symbolTable.put(key: "C", value: 3)
        symbolTable.put(key: "F", value: 6)
        XCTAssertEqual(3, symbolTable.get(key: "C"))
        XCTAssertEqual(4, symbolTable.size())
        symbolTable.put(key: "C", value: nil)
        XCTAssertNil(symbolTable.get(key: "C"))
        XCTAssertEqual(3, symbolTable.size())
    }

    func testDeleteNonKeys1() {
        symbolTable.put(key: "D", value: 4)
        symbolTable.put(key: "B", value: 2)
        symbolTable.put(key: "C", value: 3)
        symbolTable.put(key: "F", value: 6)
        XCTAssertNil(symbolTable.get(key: "A"))
        XCTAssertNil(symbolTable.get(key: "E"))
        XCTAssertNil(symbolTable.get(key: "G"))
        XCTAssertEqual(4, symbolTable.size())
        symbolTable.delete(key: "A")
        symbolTable.delete(key: "E")
        symbolTable.delete(key: "G")
        XCTAssertNil(symbolTable.get(key: "A"))
        XCTAssertNil(symbolTable.get(key: "E"))
        XCTAssertNil(symbolTable.get(key: "G"))
        XCTAssertEqual(4, symbolTable.size())
    }

    func testDeleteNonKeys2() {
        symbolTable.put(key: "D", value: 4)
        symbolTable.put(key: "B", value: 2)
        symbolTable.put(key: "C", value: 3)
        symbolTable.put(key: "F", value: 6)
        XCTAssertNil(symbolTable.get(key: "A"))
        XCTAssertNil(symbolTable.get(key: "E"))
        XCTAssertNil(symbolTable.get(key: "G"))
        XCTAssertEqual(4, symbolTable.size())
        symbolTable.put(key: "A", value: nil)
        symbolTable.put(key: "E", value: nil)
        symbolTable.put(key: "G", value: nil)
        XCTAssertNil(symbolTable.get(key: "A"))
        XCTAssertNil(symbolTable.get(key: "E"))
        XCTAssertNil(symbolTable.get(key: "G"))
        XCTAssertEqual(4, symbolTable.size())
    }

    func testDeleteEmpty() {
        XCTAssertEqual(0, symbolTable.size())
        symbolTable.delete(key: "Anything")
        XCTAssertEqual(0, symbolTable.size())
    }

    func testDeleteMin() {
        symbolTable.put(key: "D", value: 4)
        symbolTable.put(key: "B", value: 2)
        symbolTable.put(key: "C", value: 3)
        symbolTable.put(key: "F", value: 6)
        XCTAssertEqual("B", symbolTable.min())
        symbolTable.deleteMin()
        XCTAssertNil(symbolTable.get(key: "B"))
        XCTAssertEqual("C", symbolTable.min())
    }

    func testDeleteMax() {
        symbolTable.put(key: "D", value: 4)
        symbolTable.put(key: "B", value: 2)
        symbolTable.put(key: "C", value: 2)
        symbolTable.put(key: "F", value: 2)
        XCTAssertEqual("F", symbolTable.max())
        symbolTable.deleteMax()
        XCTAssertNil(symbolTable.get(key: "F"))
        XCTAssertEqual("D", symbolTable.max())
    }

    func testPerformanceTiny() {
        let words = read(filename: "TinyTale.txt")
        let minimumLength = 3
        for word in words {
            if word.characters.count >= minimumLength {
                if symbolTable.contains(key: word) {
                    symbolTable.put(key: word, value: 1 + symbolTable.get(key: word)!)
                } else {
                    symbolTable.put(key: word, value: 1)
                }
            }
        }
        // Find a key with the highest frequency count.
        var maxKey   = ""
        var maxCount = 0
        for word in symbolTable.keys() {
            let wordCount = symbolTable.get(key: word) ?? 0
            if wordCount > maxCount {
                maxKey   = word
                maxCount = wordCount
            }
        }
        print("\n\nTinyTale: Most frequent word with a minumum length of \(minimumLength): \(maxKey) (\(maxCount) times).\n\n")
    }

    func read(filename: String) -> [String] {

        let name = filename.components(separatedBy: ".")
        let path = Bundle.main.path(forResource: name[0], ofType: name[1])
        let text = try! String(contentsOfFile: path!)
        return text.components(separatedBy: CharacterSet(charactersIn: " \n"))
    }
}
