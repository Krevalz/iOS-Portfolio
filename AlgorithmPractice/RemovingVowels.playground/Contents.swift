//: Playground - noun: a place where people can play

import Foundation

let sentence = "This sentence should have no vowels by the end of the function call"

extension String {
    func removeVowels() -> String {
        let characters = self.characters
        var result = ""
        for character in characters {
            switch character {
            case "a", "e", "i", "o", "u", "y":
                break
            default:
                result += String(character)
            }
        }
        return result
    }
}

print(sentence)
print(sentence.removeVowels())
