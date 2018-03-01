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

a.chunk(size: 5).flatMap({ $0 }).enumerated().forEach({
  print("\($0) \($1)")
})

let tmp = [[1, 2, 3],[]].filter({ !$0.isEmpty })

tmp


struct Desk {
  let id: Int
  let name: String
}

var desks: [Desk] = []

desks = [Desk(id: 1, name: "1"), Desk(id: 2, name: "2"), Desk(id: 3, name: "3")]

//let numberedDesks = desks.reduce(true) { $0 && Int($1.name) != nil }


let numberedDesks = desks.reduce(true) { result, desk -> Bool in
  
  print("\(result) \(desk.name) \(Int(desk.name))")
  
  return result && Int(desk.name) != nil
}

print(numberedDesks)
