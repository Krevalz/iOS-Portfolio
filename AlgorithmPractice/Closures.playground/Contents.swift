//: Playground - noun: a place where people can play

import Foundation

// Non closure
func filterGreaterThanValue(value: Int, numbers: [Int]) -> [Int] {
    var result = [Int]()
    for number in numbers {
        if number > value {
            result.append(number)
        }
    }
    return result
}

// With closure
func filterNumbers(numbers: [Int], condition: (Int)->Bool) -> [Int]{
    var result = [Int]()
    for number in numbers {
        if condition(number) {
            result.append(number)
        }
    }
    return result
}

func map(numbers: [Int], mapFor:(Int)->Int) -> [Int] {
    var result = [Int]()
    for i in 0..<numbers.count {
        result.append(mapFor(numbers[i]))
    }
    return result
}

func reduce(numbers: [Int], initialValue: Int, partialStep:(_ result: Int, _ next: Int) -> Int) -> Int{
    var result = initialValue
    for number in numbers {
        result = partialStep(result, number)
    }
    return result
}

let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

filterGreaterThanValue(value: 6, numbers: numbers)

print(filterNumbers(numbers: numbers, condition: {$0 == 5 || $0 == 3}))
print(filterNumbers(numbers: numbers, condition: {$0 > 6}))

print(map(numbers: numbers, mapFor: {$0 * 3}))
print(map(numbers: numbers, mapFor: {$0 % 4}))

print(reduce(numbers: numbers, initialValue: 0, partialStep: {$0 + $1}))
print(reduce(numbers: numbers, initialValue: 100, partialStep: {$0 - $1}))
