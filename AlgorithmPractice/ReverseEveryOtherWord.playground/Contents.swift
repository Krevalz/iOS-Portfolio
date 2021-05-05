//: Playground - noun: a place where people can play

import Foundation

var str = "Every other word in this string should be reversed."

extension String {
    func reverseEveryOtherWord() -> String {
        var stringArray = self.components(separatedBy: " ")
        var sentence = ""
        for i in 0..<stringArray.count {
            if sentence != "" {
                sentence += " "
            }
            if (i + 1) % 2 == 0 {
                stringArray[i] = String(stringArray[i].characters.reversed())
            }
            sentence += stringArray[i]
        }
        return sentence
    }
}

print(str.reverseEveryOtherWord())
