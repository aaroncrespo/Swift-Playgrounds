//: Playground - noun: a place where people can play

import UIKit


let arr = [1,2,3,4,5]
let k = arr.maxElement() //cheating

let arrSorted = Array(arr.reverse()).countingSorted(K: k!) { $0 }

print(arrSorted)

let all = Array(zip(["car","boat","ship","mountain"], [1,2,3,4])).shuffle()

var sortedItems = Array<(String, Int)>(all)

sortedItems.countingSort(K: 5) { $0.1 }
print(sortedItems)
