//: Playground - noun: a place where people can play

import UIKit


extension Collection where Self.Iterator.Element == Self.SubSequence.Iterator.Element {
  func chunk(size: IndexDistance) -> [[Iterator.Element]] {
    let steps = sequence(first: self.startIndex, next: { previous in
      self.index(previous, offsetBy: size, limitedBy: self.endIndex)
    })

    return steps.map({ i -> Array<Iterator.Element> in
      let end = self.index(i,
                           offsetBy: size,
                           limitedBy: self.endIndex)
        ?? self.endIndex

      return Array(self[i ..< end])
    })
  }
}

extension Array {
  func takeElements(elementCount: Int) -> Array {
    if (elementCount > count) {
      return Array(self[0..<count])
    }
    return Array(self[0..<elementCount])
  }
}

let a = [1, 2, 3, 4, 5]

let chunked = a.chunk(size: 5).flatMap({ $0 })

chunked.takeElements(elementCount: 3).enumerated().forEach({ index, t in

})



let tmp = [[1, 2, 3],[]].filter({ !$0.isEmpty })

tmp

