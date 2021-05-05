//: Playground - noun: a place where people can play

import Foundation

func printCenterWith(width: Int, forString string: String) {
    if string.count > width {
        print(string)
        return
    }
    
    let numberOfSpaces = (width / 2) - (string.count / 2)
    var spaces = ""
    for _ in 0..<numberOfSpaces {
        spaces += " "
    }
    print(spaces + string)
}


func createTrianlge(depth: Int) {
    var currentRow = [Int]()
    for j in 0..<depth {
        if j == 0 {
            currentRow = [1]
        } else if j == 1 {
            currentRow = [1, 1]
        } else {
            var tempArray = [Int]()
            tempArray += [1]
            for i in 0..<(currentRow.count - 1) {
                tempArray.append(currentRow[i] + currentRow[i + 1])
            }
            tempArray += [1]
            currentRow = tempArray
        }

        var string = ""
        for element in currentRow {
            string += String(element) + " "
        }
        printCenterWith(width: 30, forString: string)
    }
}

createTrianlge(depth: 10)
