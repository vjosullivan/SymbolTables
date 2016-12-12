//
//  OrderedSymbolTable.swift
//  SymbolTables
//
//  Created by Vincent O'Sullivan on 06/12/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import Foundation

protocol OrderedSymbolTable: SymbolTable {

    func min() -> Key?
    func max() -> Key?

    /// Returns the **largest** key which is *less than or equal* to the given key.
    ///
    func floor(key: Key) -> Key?


    /// Returns the **smallest** key which is *greater than or equal* to the given key.
    ///
    func ceiling(key: Key) -> Key?

    /// Returns the number of keys that are *less* than the given key.
    ///
    func rank(key: Key) -> Int

    /// Returns the key with the given rank.
    ///
    func select(rank: Int) -> Key?

    func deleteMin()
    func deleteMax()

    func size(from loKey: Key, to hiKey: Key) -> Int
    func keys(from loKey: Key, to hiKey: Key) -> [Key]
}

extension OrderedSymbolTable {

    func deleteMin() {
        if let minKey = min() {
            delete(key: minKey)
        }
    }

    func deleteMax() {
        if let maxKey = max() {
            delete(key: maxKey)
        }
    }

    /// Returns the number of keys in the table between the two given keys (inclusive).
    /// If the "low" or "from" key is higher than the "high" or "to" key, `0` is returned.
    /// 
    func size(from loKey: Key, to hiKey: Key) -> Int {
        guard hiKey >= loKey else { return 0 }

        return rank(key: hiKey) - rank(key: loKey) + (contains(key: hiKey) ? 1 : 0)
    }
}
