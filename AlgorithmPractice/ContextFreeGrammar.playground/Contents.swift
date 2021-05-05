//: Playground - noun: a place where people can play

import Foundation

extension Array {
    func containsCapitolLetter() -> Bool {
        guard let testArray = self as? [String] else { return false }
        for element in testArray {
            if element.containsCapitolLetter() {
                return true
            }
        }
        return false
    }
    
    func removeDuplicates() -> [String] {
        guard let currentArray = self as? [String] else { return [] }
        var result = [String]()
        for value in currentArray {
            if result.contains(value) == false {
                result.append(value)
            }
        }
        return result
    }
}

extension String {
    func containsCapitolLetter() -> Bool {
        var bool = false
        for character in self {
            let character = String(character)
            if character == character.uppercased() {
                bool = true
            }
        }
        return bool
    }
}

func evaluateCFG(language: [String: [String]], rootKey: String, maxNumberOfSteps: Int) -> ([String], Int) {
    var numberOfSteps = 1
    var results = [String]()
    var rootArray = language[rootKey]!
    var flag = true
    while(flag && numberOfSteps < maxNumberOfSteps) {
        if rootArray.containsCapitolLetter() {
            numberOfSteps += 1
        }
        
        flag = false
        for branch in rootArray {
            var currentBranchArray = [""]
            for character in branch {
                let character = String(character)
                if character == character.uppercased() {
                    let stepInArray = language[character]!
                    var tempBranchArray = [String]()
                    for element in currentBranchArray {
                        tempBranchArray += stepInArray.map({element + $0})
                    }
                    currentBranchArray = tempBranchArray
                } else {
                    currentBranchArray = currentBranchArray.map({$0 + character})
                }
            }
            results = results + currentBranchArray
        }

        if results.containsCapitolLetter() {
            rootArray = results
            flag = true
        }
    }
    
    var finalArray = [String]()
    // Clean up unfinished strings
    for i in 0..<results.count {
        var contiansCapitalLetter = false
        for character in results[i] {
            let character = String(character)
            if character == character.uppercased() {
                contiansCapitalLetter = true
                break
            }
        }
        if !contiansCapitalLetter {
            finalArray.append(results[i])
        }
    }
    
    finalArray = finalArray.removeDuplicates()
    finalArray = finalArray.filter({$0 != ""})
    return (finalArray.sorted(), numberOfSteps)
}

var language = [String: [String]]()
language["S"] = ["aaaA", "aaA", "aA", "B"]
language["A"] = ["aAb", ""]
language["B"] = ["aBb" , "C"]
language["C"] = ["Cb", ""]

let tuple = evaluateCFG(language: language, rootKey: "S", maxNumberOfSteps: 3)
print(tuple.1)
for element in tuple.0 {
    print (element)
}
