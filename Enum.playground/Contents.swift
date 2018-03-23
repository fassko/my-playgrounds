//: Playground - noun: a place where people can play

import UIKit

enum Test {
  case namesList
  
  case other(String)
  
  var rawValue: String {
    switch self {
    case .other(let value):
      return value
    default:
      return String(describing: self)
    }
  }
}

let a = Test.other("aa")
a.rawValue

let b = Test.namesList
b.rawValue


enum StringTest: String {
  case pirmais
  case otrais
  
  func t() -> StringTest.RawValue {
    return StringTest.otrais.rawValue
  }
}

let e = StringTest.pirmais

var s: String?

s = e.rawValue


enum CompassPoint {
  case north
  case south
  case east
  case west
}

let compassPoint = CompassPoint.south

switch compassPoint {
case .north, .south:
  print("tete")
default:
  print("default")
}
