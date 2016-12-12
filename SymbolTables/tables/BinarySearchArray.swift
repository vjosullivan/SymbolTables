//
//  BinarySearchArray.swift
//  SymbolTables
//
//  Created by Vincent O'Sullivan on 08/12/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import Foundation

class BinarySearchArray: OrderedSymbolTable {

    typealias Key = String
    typealias Value = Int

    private var keyList   = [Key]()
    private var valueList = [Value]()
    private var listSize  = 0
    
    func put(key: Key, value: Value?) {
        guard let value = value else {
            delete(key: key)
            return
        }
        // Look for key.  If found replace value, otherwise insert new key/value.
        let r = rank(key: key)
        if r < listSize && keyList[r] == key {
            valueList[r] = value
        } else {
            keyList.insert(key, at: r)
            valueList.insert(value, at: r)
            listSize += 1
        }
    }

    func get(key: Key) -> Value? {
        guard !isEmpty() else {
            return nil
        }
        let r = rank(key: key)
        if r < listSize && keyList[r] == key {
            return valueList[r]
        }
        return nil
    }

    func delete(key: Key) {
        guard !isEmpty() else {
            return
        }
        let r = rank(key: key)
        if r < listSize && keyList[r] == key {
            keyList.remove(at: r)
            valueList.remove(at: r)
            listSize -= 1
        }
    }

    func contains(key: Key) -> Bool {
        guard !isEmpty() else {
            return false
        }
        let r = rank(key: key)
        return r < listSize && keyList[r] == key
    }

    func isEmpty() -> Bool {
        return listSize == 0
    }

    func size() -> Int {
        return listSize
    }

    func keys() -> [Key] {
        return keyList
    }

    func min() -> Key? {
        return keyList.first
    }

    func max() -> Key? {
        return keyList.max()
    }

    func floor(key: Key) -> Key? {
        if contains(key: key) { return key }
        let r = rank(key: key)
        return r > 0 ? keyList[r - 1] : nil
    }

    func ceiling(key: Key) -> Key? {
        if contains(key: key) { return key }
        let r = rank(key: key)
        return r < listSize ? keyList[r] : nil
    }

    func rank(key: Key) -> Int {
        return listSize == 0 ? 0 : rank(key: key, lo: 0, hi: listSize - 1)
    }

    func rank(key: Key, lo: Int, hi: Int) -> Int {
        if hi < lo { return lo }

        let mid = lo + (hi - lo) / 2
        if keyList[mid] > key {
            return rank(key: key, lo: lo, hi: mid - 1)
        } else if keyList[mid] < key {
            return rank(key: key, lo: mid + 1, hi: hi)
        }
        return mid
    }

    func select(rank: Int) -> Key? {
        return rank < listSize ? keyList[rank] : nil
    }

    func clear() {
        keyList   = [Key]()
        valueList = [Value]()
        listSize  = 0
    }

    func deleteMin() {
        keyList.removeFirst()
    }

    func deleteMax() {
        keyList.removeLast()
    }

    func size(from loKey: Key, to hiKey: Key) -> Int {
        let rankLo = rank(key: loKey)
        let rankHi = rank(key: hiKey)

        return Swift.min(rankHi - rankLo, 0)
    }

    func keys(from loKey: Key, to hiKey: Key) -> [Key] {
        guard hiKey >= loKey, listSize > 0 else {
                return [Key]()
        }
        guard let keyLo = ceiling(key: loKey),
            let keyHi = floor(key: hiKey) else {
                return [Key]()
        }
        let rankLo = rank(key: keyLo)
        let rankHi = rank(key: keyHi)
        var relevantKeys = [Key]()
        if rankHi < rankLo { return relevantKeys }
        for r in rankLo...rankHi {
            relevantKeys.append(keyList[r])
        }
        return relevantKeys
    }

    func allKeys() -> [Key] {
        return keyList
    }
}
