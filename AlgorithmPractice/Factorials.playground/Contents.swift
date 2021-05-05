//: Playground - noun: a place where people can play

import UIKit

func factorialOf(value: UInt) -> UInt {
    return value == 1 ? 1 : value * factorialOf(value: value - 1)
}

print(factorialOf(value: 5))
print(factorialOf(value: 10))
