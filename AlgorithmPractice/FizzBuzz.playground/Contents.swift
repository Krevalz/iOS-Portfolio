//: Playground - noun: a place where people can play

import Foundation

let FIZZ = "Fizz"
let BUZZ = "Buzz"
let count = 30

for i in 1...count {
    let fizz = i % 3 == 0
    let buzz = i % 5 == 0
    switch(fizz, buzz) {
        case (true, true):
            print(FIZZ + BUZZ)
        case(true, false):
            print(FIZZ)
        case(false, true):
            print(BUZZ)
        default:
            print(i)
    }
}
