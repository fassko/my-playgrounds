//: Playground - noun: a place where people can play

import UIKit



enum Source: String, Codable {
  case manual = "MANUAL"
  case name = "NAME"
  case printer = "PRINTER"
  case other
  
  init?(rawValue: Source.RawValue) {
    switch rawValue.lowercased() {
    case "manual":
      self = .manual
    case "name":
      self = .name
    case "printer":
      self = .printer
    default:
      self = .other
    }
  }
}

let sources: [Source] = [.manual, .name]

sources.contains(.name)
