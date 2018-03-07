//: Playground - noun: a place where people can play

import UIKit

protocol SampleProtocol {
  var id: String? { get set }
  
  func hello()
}

extension SampleProtocol {
  func hello() {
    print("hello")
  }
}

struct Sample: SampleProtocol {
  var id: String?
  
  func hello() {
    print("Hello")
  }
}


let s = Sample()

s.hello()
