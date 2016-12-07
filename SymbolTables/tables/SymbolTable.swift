//
//  SymbolTable.swift
//  SymbolTables
//
//  Created by Vincent O'Sullivan on 06/12/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import Foundation

protocol SymbolTable {

    associatedtype Key: Comparable
    associatedtype Value


    /// Inserts a `key:value` pair into the table (or deletes it if the `value` is nil).
    /// If the key already exists in the table, the existing value is
    /// overwritten with the new value.
    ///
    func put(key: Key, value: Value?)

    func get(key: Key) -> Value?

    /// Deletes the key (and its associated value) from the table.
    /// If the table does not contain the key, nothing happens.
    ///
    func delete(key: Key)

    func contains(key: Key) -> Bool

    func isEmpty() -> Bool

    func size() -> Int

    func keys() -> [Key]
}

// MARK: - Default implementations (of helper functions).

extension SymbolTable {

    func delete(key: Key) {
        put(key: key, value: nil)
    }

    func contains(key: Key) -> Bool {
        return get(key: key) != nil
    }

    func isEmpty() -> Bool {
        return size() == 0
    }
}
