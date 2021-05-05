//: Playground - noun: a place where people can play

import Foundation

// example
12 * 14 + 12

//       +
//    /    \
//   *     12
//  / \
//12   14

class Node {
    var operation: String? //+ - * /
    var value: Float?
    var leftChild: Node?
    var rightChild: Node?
    
    init(operation: String?, value: Float?, leftChild: Node?, rightChild: Node?) {
        self.operation = operation
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

let twelveNode = Node(operation: nil, value: 12, leftChild: nil, rightChild: nil)
let fourteenNode = Node(operation: nil, value: 14, leftChild: nil, rightChild: nil)
let multiply = Node(operation: "*", value: nil, leftChild: twelveNode, rightChild: fourteenNode)
let plus = Node(operation: "+", value: nil, leftChild: multiply, rightChild: twelveNode)

func evaluteValueAt(node: Node) -> Float {
    if let operation = node.operation {
        switch(operation) {
        case "+":
            return evaluteValueAt(node: node.leftChild!) + evaluteValueAt(node: node.rightChild!)
        case "-":
            return evaluteValueAt(node: node.leftChild!) - evaluteValueAt(node: node.rightChild!)
        case "*":
            return evaluteValueAt(node: node.leftChild!) * evaluteValueAt(node: node.rightChild!)
        case "/":
            return evaluteValueAt(node: node.leftChild!) / evaluteValueAt(node: node.rightChild!)
        default:
            return 0
        }
    }
    return node.value!
}

print(evaluteValueAt(node: plus))

