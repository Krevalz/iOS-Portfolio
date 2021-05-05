//: Playground - noun: a place where people can play

import Foundation

class Node<T> {
    let value: T
    var prev: Node?
    init (value: T) {
        self.value = value
    }
    deinit {
        print("Removing Node with value: \(value)")
    }
}

class Stack<T> {
    private var topNode: Node<T>?

    func push(value: T) {
        let oldNode = topNode
        topNode = Node<T>(value: value)
        topNode?.prev = oldNode
    }
    
    func pop() -> T? {
        let oldNode = topNode
        topNode = topNode?.prev
        return oldNode == nil ? nil : oldNode?.value
    }
    
    func top() -> T? {
        return topNode == nil ? nil : topNode?.value
    }
}

var stack = Stack<String>()

stack.push(value: "Josh")
stack.push(value: "Khyri")
stack.push(value: "Aman")

stack.top()

stack.pop()
