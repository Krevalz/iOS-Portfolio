//: Playground - noun: a place where people can play

import Foundation

func countPalindromes(inSentence sentence: String) -> Int {
    var counter = 0
    let words = sentence.split(separator: " ")
    for word in words {
        let reverse = String(word.reversed())
        if word.lowercased() == reverse.lowercased() {
            print(word)
            counter += 1
        }
    }
    return counter
}

let palindromes = "madam anna kayak josh Civic racecar"

print(countPalindromes(inSentence: palindromes))

