//: Playground - noun: a place where people can play

import Foundation

class Node {
    let value: Int
    let leftChild: Node?
    let rightChild: Node?
    
    init(value: Int, leftChild: Node?, rightChild: Node?) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

func search(node: Node?, searchValue: Int) -> Bool {
    if node?.value == searchValue {
        print("Found node \(searchValue)")
        return true
    }
    
    switch (node?.leftChild, node?.rightChild) {
    case (nil, nil):
        print("\((node?.value)!) is a leaf")
        return false
    case (nil, _):
        print("Searching right on node \((node?.value)!)")
        return search(node: node?.rightChild, searchValue: searchValue)
    case (_, nil):
        print("Searching left on node \((node?.value)!)")
        return search(node: node?.leftChild, searchValue: searchValue)
    default:
        print("Searching left and right on node \((node?.value)!)")
        return search(node: node?.leftChild, searchValue: searchValue) || search(node: node?.rightChild, searchValue: searchValue)
    }
}

//        1
//       / \
//      2   4
//     / \   \
//    3   6   5
//     \
//       7


let sevenNode = Node(value: 7, leftChild: nil, rightChild: nil)
let sixNode = Node(value: 6, leftChild: nil, rightChild: nil)
let fiveNode = Node(value: 5, leftChild: nil, rightChild: nil)
let fourNode = Node(value: 4, leftChild: nil, rightChild: fiveNode)
let threeNode = Node(value: 3, leftChild: nil, rightChild: sevenNode)
let twoNode = Node(value: 2, leftChild: threeNode, rightChild: sixNode)
let oneNode = Node(value: 1, leftChild: twoNode, rightChild: fourNode)

print(search(node: oneNode, searchValue: 6))
