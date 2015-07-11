//: Playground - noun: a place where people can play

import UIKit

// counting sort is defined on things that can compared as Int's!
// we also need to know something about the input data set for example max value

extension MutableCollectionType where Index == Int {
    mutating func countingSort(K K: Int, transform: ((Generator.Element) -> Int)) {
        // swift arrays are fixed in size and non sparse (repeating value of nil still requires K size)
        // the only way to grow an array is append which does not lend does not let us build a histogram in value places
        //
        // Basically, we need to treat an Array<T> as a Dictionary<Int,T>
        // While maintaing ordering and avoiding all the  stuff like hashing and resizing that will add to run time.
        var count = Array<Int>(count: K + 1, repeatedValue: 0)
        
        for elm in self {
            count[transform(elm)] += 1
        }
        
        var total = 0
        
        for i in 0..<count.count where count[i] > 0 {
            let oldCount = count[i]
            count[i] = total
            total += oldCount
        }
        
        for elm in self {
            self[count[transform(elm)]] = elm
            count[transform(elm)] += 1
        }
    }
}

extension CollectionType where Index == Int {
    func countingSorted(K K: Int, transform: ((Generator.Element) -> Int)) -> [Generator.Element] {
        var output = Array(self)
        output.countingSort(K: K, transform: transform)
        return output
    }
}

let arr = [1,2,3,4,5]
let k = arr.maxElement() //cheating

let arrSorted = Array(arr.reverse()).countingSorted(K: k!) { $0 }

print(arrSorted)

let all = Array(zip(["car","boat","ship","mountain"], [1,2,3,4])).shuffle()

var sortedItems = Array<(String, Int)>(all)

sortedItems.countingSort(K: 5) { $0.1 }
print(sortedItems)


