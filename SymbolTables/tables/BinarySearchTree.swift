//
//  BinarySearchTree.swift
//  SymbolTables
//
//  Created by Vincent O'Sullivan on 10/12/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import Foundation

class BinarySearchTree: OrderedSymbolTable {

    typealias Key   = String
    typealias Value = Int

    private class Node {
        
    }
    
    func put(key: Key, value: Value?) {
        // TODO:
    }

    func get(key: Key) -> Value? {
        // TODO:
        return nil
    }

    func size() -> Int {
        // TODO:
        return 0
    }

    func keys() -> [Key] {
        // TODO:
        return [Key]()
    }

    func min() -> Key? {
        // TODO:
        return nil
    }

    func max() -> Key? {
        // TODO:
        return nil
    }

    func floor(key: Key) -> Key? {
        // TODO:
        return nil
    }


    func ceiling(key: Key) -> Key? {
        // TODO:
        return nil
    }

    func rank(key: Key) -> Int {
        // TODO:
        return 0
    }

    func select(rank: Int) -> Key? {
        // TODO:
        return nil
    }

    func keys(fromKey lo: Key, toKey hi: Key) -> [Key] {
        // TODO:
        return [Key]()
    }

    func sortedKeys() -> [Key] {
        // TODO:
        return [Key]()
    }
}
