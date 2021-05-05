//: Playground - noun: a place where people can play

import Foundation

// set 1
let numbers = [1, 2, 1, 5, 9, 6, 2, 5]
let filtered = numbers.filter({$0 == 1})
print(filtered)

let mapped = numbers.map({$0 * 2})
print(mapped)

let reduced = numbers.reduce(0, {$0 + $1})
print(reduced)

// set 2

let ordered = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let filteredLessThanFive = ordered.filter({$0 < 5})
print(filteredLessThanFive)

let flippedOrder = ordered.map({11 - $0})
print(flippedOrder)

let average = ordered.reduce(0, {$0 + $1}) / ordered.count
print(average)
