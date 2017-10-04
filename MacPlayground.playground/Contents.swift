//: Playground - noun: a place where people can play

import Foundation
import XCPlayground

XCPSetExecutionShouldContinueIndefinitely()

//Observable<Int>.timer(RxTimeInterval(5), scheduler: MainScheduler.instance)
//  .skipWhile({_ in self.connectionClosed })
//  .filter({_ in
//
//    // if there is error at all
//    guard let err = error else {
//      return true
//    }
//
//    // don't reopen if going away normally
//    return UInt16(err.code) != self.websocketReservedCloseCode
//  })
//  // do it onlu if disconnected
//  .filter({ _ in !self.socket.isConnected })
//  .subscribe(onNext: {_ in
//    print("Auto reopen Socket")
//  self.openSocket()
//  -      })
//  -      .addDisposableTo(disposeBag)
//+      }
//+    })


class Events {
  
  /// Is connection closed
  var connectionClosed: Bool
  
  var isConnected = false
  
  /// Qminder close code
  private let websocketReservedCloseCode = UInt16(1099)
  
  init(closed: Bool) {
    self.connectionClosed = closed
  }
  
  func onDisconnect(error:NSError?) {

    Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true, block: {timer in
      
      // If is disconnected
      if self.connectionClosed || self.isConnected {
        timer.invalidate()
        return
      }
      
      // Check if there is an error
      guard let err = error else {
        timer.invalidate()
        return
      }

      // don't reopen if going away normally
      if UInt16(err.code) == self.websocketReservedCloseCode {
        print("tete3")
        timer.invalidate()
        return
      }

      // Reopen socket
      print("openSocket")

    })
  }
}

let e = Events(closed: false)

let err = NSError(domain: "Q", code: 666)

e.onDisconnect(error: err)


//var arr = [1, 2, 3, 4, 5, 6, 7, 8]
//
//var barr = arr.flatMap({ $0 == 2 ? nil : $0 })

//extension Array {
//
//  public subscript (safe subRange: Range<Int>) -> ArraySlice<Element> {
//
//    let from = index(startIndex, offsetBy: subRange.lowerBound, limitedBy: endIndex) ?? endIndex
//    let to = index(startIndex, offsetBy:  subRange.upperBound, limitedBy: endIndex) ?? endIndex
//    return self[from ..< to]
//  }
//}
//
//let arr = [1,2,3,4,5]
//print(arr[safe: Range(1...2)]) // [2,3]
//
//
//let z: [Int] = []
//
//print(z.endIndex)

//z[z.startIndex...min(z.endIndex-1, 20)]




//extension Collection where Self.Iterator.Element == Self.SubSequence.Iterator.Element {
//  func chunk(size: IndexDistance) -> [[Iterator.Element]] {
//    let steps = sequence(first: self.startIndex, next: { previous in
//      self.index(previous, offsetBy: size, limitedBy: self.endIndex)
//    })
//    return steps.map({ i -> Array<Iterator.Element> in
//      let end = self.index(i,
//                           offsetBy: size,
//                           limitedBy: self.endIndex)
//        ?? self.endIndex
//      return Array(self[i ..< end])
//    })
//  }
//}
//
//extension Array {
//  func takeElements(elementCount: Int) -> Array {
//    if (elementCount > count) {
//      return Array(self[0..<count])
//    }
//    return Array(self[0..<elementCount])
//  }
//}
//
//var a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
//
//let b = a.map({ $0 % 2 == 0 })
//print(b)
//
//a.remove(at: a.index(where: { $0 == 1 })!)
//
//print(a[0...(a.count < 20 ? a.count-1 : 20)])
//
//let index = a.index(where: {$0 == 1})
//
//print(index)
//
//let chunked = a.chunk(size: 2)
//
//
//chunked.takeElements(elementCount: 3)
//
//
//
//[].chunk(size: 3).first

