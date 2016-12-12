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

    private var root: Node? = nil

    private class Node {
        fileprivate let key: Key
        fileprivate var value: Value
        fileprivate var left: Node?  = nil
        fileprivate var right: Node? = nil
        fileprivate var nodeCount = 0

        init(key: Key, value: Value, nodeCount: Int) {
            self.key   = key
            self.value = value
            self.nodeCount = nodeCount
        }

        func updateNodeCount() {
            nodeCount = 1 + (left?.nodeCount ?? 0) + (right?.nodeCount ?? 0)
        }
    }
    
    func put(key: Key, value: Value?) {
        guard let value = value else {
            delete(key: key)
            return
        }
        root = put(node: root, key: key, value: value)
    }

    private func put(node: Node?, key: Key, value: Value) -> Node {
        guard let node = node else {
            return Node(key: key, value: value, nodeCount: 1)
        }
        switch key.compare(node.key) {
        case .orderedAscending:
            node.left = put(node: node.left,  key: key, value: value)
        case .orderedDescending:
            node.right = put(node: node.right, key: key, value: value)
        case .orderedSame:
            node.value = value
        }
        node.updateNodeCount()
        return node
    }

    func get(key: Key) -> Value? {
        return get(node: root, key: key)
    }

    private func get(node: Node?, key: Key) -> Value? {
        guard let node = node else {
            return nil
        }
        if node.key >  key { return get(node: node.left,  key: key) }
        if node.key <  key { return get(node: node.right, key: key) }
        return node.value
    }

    func size() -> Int {
        return root?.nodeCount ?? 0
    }

    func keys() -> [Key] {
        // TODO:
        return [Key]()
    }

    func min() -> Key? {
        guard let root = root else {
            return nil
        }
        return min(node: root).key
    }

    private func min(node: Node) -> Node {
        if let leftNode = node.left {
            return min(node: leftNode)
        }
        return node
    }

    func max() -> Key? {
        guard let root = root else {
            return nil
        }
        return max(node: root).key
    }

    private func max(node: Node) -> Node {
        if let rightNode = node.right {
            return max(node: rightNode)
        }
        return node
    }

    func floor(key: Key) -> Key? {
        return floor(node: root, key: key)
    }

    private func floor(node: Node?, key: Key) -> Key? {
        guard let node = node else {
            return nil
        }
        switch key.compare(node.key) {
        case .orderedSame:
            return key
        case .orderedAscending:
            if let leftNode = node.left {
                return floor(node: leftNode, key: key)
            }
            return nil
        case .orderedDescending:
            if let rightNode = node.right {
                if rightNode.key <= key {
                    return floor(node: rightNode, key: key)
                }
            }
            return node.key
        }
    }

    func ceiling(key: Key) -> Key? {
        return ceiling(node: root, key: key)
    }

    private func ceiling(node: Node?, key: Key) -> Key? {
        guard let node = node else {
            return nil
        }
        switch key.compare(node.key) {
        case .orderedSame:
            return key
        case .orderedDescending:
            if let rightNode = node.right {
                return ceiling(node: rightNode, key: key)
            }
            return nil
        case .orderedAscending:
            if let leftNode = node.left {
                if leftNode.key >= key {
                    return ceiling(node: leftNode, key: key)
                }
            }
            return node.key
        }
    }

    func rank(key: Key) -> Int {
        return rank(node: root, key: key)
    }

    private func rank(node: Node?, key: Key) -> Int {
        guard let node = node else {
            return 0
        }
        if key < node.key {
            return rank(node: node.left, key: key)
        }
        if key > node.key {
            return (node.left?.nodeCount ?? 0) + 1 + rank(node: node.right, key: key)
        }
        return node.left?.nodeCount ?? 0
    }

    func select(rank: Int) -> Key? {
        guard rank >= 0 && rank < size() else {
            return nil
        }
        return select(node: root!, rank: rank)
    }

    private func select(node: Node, rank: Int) -> Key? {
        let leftNodeCount = node.left?.nodeCount ?? 0
        if leftNodeCount > rank {
            return select(node: node.left!, rank: rank)
        }
        if leftNodeCount < rank {
            return select(node: node.right!, rank: rank - leftNodeCount - 1)
        }
        return node.key
    }

    func deleteMin() {
        root = deleteMin(node: root)
    }

    private func deleteMin(node: Node?) -> Node? {
        guard let node = node else {
            return nil
        }
        if node.left == nil {
            return node.right
        }
        node.left = deleteMin(node: node.left)
        node.updateNodeCount()
        return node
    }

    func deleteMax() {
        root = deleteMax(node: root)
    }

    private func deleteMax(node: Node?) -> Node? {
        guard let node = node else {
            return nil
        }
        if node.right == nil {
            return node.left
        }
        node.right = deleteMax(node: node.right)
        node.updateNodeCount()
        return node
    }

    func delete(key: Key) {
        root = delete(node: root, key: key)
    }

    private func delete(node: Node?, key: Key) -> Node?{
        guard var node = node else {
            return nil
        }
        switch key.compare(node.key) {
        case .orderedAscending:
            node.left = delete(node: node.left, key: key)
        case .orderedDescending:
            node.right = delete(node: node.right, key: key)
        case .orderedSame:
            if node.right == nil { return node.left }
            if node.left  == nil { return node.right }
            let temp = node
            node = min(node: temp.right!)
            node.right = deleteMin(node: temp.right)
            node.left  = temp.left
        }
        node.updateNodeCount()
        return node
    }

    func keys(fromKey lo: Key, toKey hi: Key) -> [Key] {
        // TODO:
        return [Key]()
    }

    func sortedKeys() -> [Key] {
        // TODO:
        return [Key]()
    }

    func clear() {
        root = nil
    }
}
