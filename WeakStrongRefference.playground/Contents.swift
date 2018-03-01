//: Playground - noun: a place where people can play

import UIKit

class Test {
  
  init() {
    print("init Test")
  }
  
  deinit {
    print("deinit Test")
  }
}

class Test2 {
  
  let test: Test = Test()
  
  init() {
    print("init Test2")
  }
  
  deinit {
    print("deinit Test2")
  }
}

var t2: Test2? = Test2()
t2 = nil
