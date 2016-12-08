//
//  SequentialSearchSymbolTable.swift
//  SymbolTables
//
//  Created by Vincent O'Sullivan on 07/12/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import Foundation

class SequentialSearchSymbolTable: SymbolTable {

    private var first:Node?
    private var nodeCount = 0

    private class Node {
        let key: String
        var value: Int
        var next:Node?

        public init(key: String, value: Int, next: Node?)
        {
            self.key   = key
            self.value = value
            self.next  = next
        }
    }

    func get(key: String) -> Int? {
        var node = first
        while node != nil {
            if node?.key == key {
                return node?.value
            }
            node = node?.next
        }
        return nil
    }

    func put(key: String, value: Int?) {
        guard let value = value else {
            delete(key: key)
            return
        }

        var node = first
        while node != nil {
            if node?.key == key {
                node?.value = value
                return
            }
            node = node?.next
        }
        first = Node(key: key, value: value, next: first)
        nodeCount += 1
    }

    func size() -> Int {
        return nodeCount
    }

    func keys() -> [String] {
        var keyList = [String]()
        var node = first
        while node != nil {
            keyList.append((node?.key)!)
            node = node?.next
        }
        return keyList
    }
}
