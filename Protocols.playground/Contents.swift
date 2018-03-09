//: Playground - noun: a place where people can play

import UIKit

protocol SampleProtocol {
  var id: String? { get set }
  
  var address: String { get set }
  
  func hello()
  
  init(adr: String)
}

extension SampleProtocol {
  func hello() {
    print("hello")
  }
  
  init(adr: String) {
    
  }
}

struct Sample: SampleProtocol {
  var address: String
  
  var id: String?
  
  func hello() {
    print("Hello")
  }
}


let s = Sample(adr: "aa")

s.hello()
