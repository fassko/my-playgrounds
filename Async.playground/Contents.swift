//: Playground - noun: a place where people can play

import Foundation

public class Async {

  class func waterfall(_ initialValue: Any? = nil,_ chain:[(@escaping (Any?) -> (), Any?) throws -> ()],end: @escaping (Error?, Any?) -> () ) {
    guard let function = chain.first else {
      end(nil, initialValue)
      return
    }
    do {
      try function({ (newResult: Any?) in  waterfall(newResult, Array(chain.dropFirst()), end: end) }, initialValue)
    }
    catch let error {
      end(error, nil)
    }
  }
}

Async.waterfall("one", [
  { done, argument in
    print(argument)
    done("two")
  },
  { done, argument in
    print(argument)
    done("three")
  }
  ],
                end: {error, result in
  print(result)
})

let hex = "FFFFFF"

let code = UInt(hex, radix: 16)
