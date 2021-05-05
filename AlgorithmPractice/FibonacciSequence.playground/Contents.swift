//: Playground - noun: a place where people can play

import Foundation

func fibonacciSequence(withNumberOfSteps steps: Int) -> [Int] {
    var sequence = [Int]()
    for i in 0..<steps {
        switch  i {
        case 0:
            sequence.append(0)
        case 1:
            sequence.append(1)
        default:
            sequence.append(sequence[i - 2] + sequence[i - 1])
        }
    }
    return sequence
}

func fibonacciSequenceRecursion(firstNumber first: Int, secondNumber second: Int, steps step: Int) -> [Int] {
    struct holder {
        static var start = true
    }
    if holder.start {
        if step == 0 {
            return []
        } else if step == 1 {
            return [0]
        } else if step == 2 {
            return [0, 1]
        } else {
            holder.start = false
            return [0, 1] + fibonacciSequenceRecursion(firstNumber: first, secondNumber: first + second, steps: step - 2)
        }
    }
    if step == 0 {
        holder.start = true
        return []
    }
    return[first + second] + fibonacciSequenceRecursion(firstNumber: second, secondNumber: first + second, steps: step - 1)
}

print(fibonacciSequence(withNumberOfSteps: 10))
print(fibonacciSequenceRecursion(firstNumber: 0, secondNumber: 1, steps: 60))
