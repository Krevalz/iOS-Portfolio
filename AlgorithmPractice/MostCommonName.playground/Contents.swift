//: Playground - noun: a place where people can play

import Foundation

func mostCommonNameInArray(array: [String]) -> String {
    var dictionary = [String: Int]()
    for name in array {
        if dictionary.keys.contains(name) {
            dictionary[name] = 1 + dictionary[name]!
        } else {
            dictionary[name] = 1
        }
    }
    
    var mostCommonName = ""

    for key in dictionary.keys {
        if mostCommonName == "" {
            mostCommonName = key
        } else {
            if dictionary[key]! > dictionary[mostCommonName]! {
                mostCommonName = key
            }
        }
    }
    
    print (dictionary.values.sorted())
    print (array.sorted())
    return mostCommonName
}


print (mostCommonNameInArray(array: ["Bob", "Sally", "Bob", "Sam", "Michael", "Sally", "Sally", "Bob"]))

var numbers = [1,5,6,3,4,1,3,4,7,8,6,4,3,9]
print (numbers.sorted())
