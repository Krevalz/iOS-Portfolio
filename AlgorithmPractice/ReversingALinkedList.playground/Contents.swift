//: Playground - noun: a place where people can play

import Foundation

// Node to construct linked list
class Node<T> {
    var value: T
     var next: Node<T>?

    init(value: T, next: Node<T>?) {
        self.value = value
        self.next = next
    }
}

// Simple function to show what each node points to
func printList<T> (head: Node<T>) -> String {
    if head.next != nil {
        return "\(head.value) -> " + printList(head: head.next!)
    } else {
        return "\(head.value)"
    }
}

func reverseList<T>(head: Node<T>) {
    var array = [T]()
    var iterator: Node<T>? = head
    
    // Creates ordered array of list values
    while iterator != nil {
        array.append(iterator!.value)
        iterator = iterator?.next
    }
    
    // Reverses the values
    array = array.reversed()
    
    // Updates the values inside of the list
    iterator = head
    for value in array {
        iterator?.value = value
        iterator = iterator?.next
    }
}

// Create a simple linked list
let tail = Node(value: 4, next: nil)
let third = Node(value: 3, next: tail)
let second = Node(value: 2, next: third)
let head = Node(value: 1, next: second)

print(printList(head: head))
reverseList(head: head)
print(printList(head: head))

// Practice with tuples
let firstName = Node(value: "Joshua", next: nil)
let middleName = Node(value: "Darcy", next: nil)
let lastName = Node(value: "Ramos", next: nil)
(firstName.next, middleName.next,lastName.next) = (middleName, lastName, nil)

print(printList(head: firstName))
reverseList(head: firstName)
print(printList(head: firstName))
