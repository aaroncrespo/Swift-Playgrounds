import Foundation

public extension CollectionType where Self: RangeReplaceableCollectionType {
    
    public func permutations(workingResults: [Self] = []) -> [Self] {
        
        let resultsInWork: [Self]
        if workingResults.count == 0 && self.count > 0 {
            resultsInWork = workingResults + [Self()]
        } else {
            resultsInWork = workingResults
        }
        
        if self.count == 0 {
            return [] + resultsInWork.map { $0 }
        } else {
            return indices.reduce([]) { (tot, idx) in
                var newSource = self
                newSource.removeAtIndex(idx)
                return tot + newSource.permutations(resultsInWork.reduce([Self]()) { $0 + [$1 + [self[idx]]] })
            }
        }
    }
}
