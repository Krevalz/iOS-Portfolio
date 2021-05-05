//: Playground - noun: a place where people can play

import Foundation

// Swap using Tuples
func swapDataWith<T> (values: (T, T)) -> (T, T) { return (values.1, values.0) }

// Moddified for arrays
func swapArrayValuesAt<T> (index first: Int, index second: Int, array: inout [T]) {
    (array[first], array[second]) = (array[second], array[first])
}

// Variables
var a = 1
var b = 2
var numbers = [1, 2, 3, 4]
var letters = ["a", "b", "c", "d"]

// Using first function
(a, b) = swapDataWith(values: (a, b))
print(a, b)

// Tuple Syntax
let answer = swapDataWith(values: (numbers[0], numbers[3]))
numbers[0] = answer.0; numbers[3] = answer.1

let result = swapDataWith(values: (numbers[1], numbers[2]))
(numbers[1], numbers[2]) = result

(numbers[2], numbers[3]) = swapDataWith(values: (numbers[2], numbers[3]))

let (first, second) = (letters[0], letters[1])
print(first, second)

// ---

// Using second function
swapArrayValuesAt(index: 0, index: 3, array: &numbers)
swapArrayValuesAt(index: 1, index: 2, array: &letters)
swapArrayValuesAt(index: 0, index: 2, array: &letters)
print(numbers)
print(letters)
