//: Playground - noun: a place where people can play

import Foundation

// when input 0, output will equal 0
// when input = inputMax, output will equal outputMax
// when input = -inputMax, output will equal -outputMax
// when input = 2(inputMax), output will equal 2(outputMax)
// therefor, everything scales respectively

var input = 0.0

// input can be any number from 0...inputMax
let inputMax = 300.0

// output will be any number from 0...outputMax
let outputMax = 5.0

// calculates the output
var output: Double {
    get {
        return input / (inputMax / outputMax)
    }
}

input = -600
print(output, separator: "", terminator: " ")

input = -300
print(output, separator: "", terminator: " ")

input = -150
print(output, separator: "", terminator: " ")

input = 0
print(output, separator: "", terminator: " ")

input = 150
print(output, separator: "", terminator: " ")

input = 300
print(output, separator: "", terminator: " ")

input = 600
print(output, separator: "", terminator: " ")

