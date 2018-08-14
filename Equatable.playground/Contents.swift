//: Playground - noun: a place where people can play

import UIKit

func compareOptionals<T>(lhs: T?, rhs: T?, compare: (_ lhs: T, _ rhs: T) -> Bool) -> Bool {
  switch (lhs, rhs) {
  case let (lValue?, rValue?):
    return compare(lValue, rValue)
  case (nil, nil):
    return true
  default:
    return false
  }
}

struct Interaction: Codable, Equatable {
  static func ==(lhs: Interaction, rhs: Interaction) -> Bool {
    guard lhs.start == rhs.start else { return false }
    guard compareOptionals(lhs: lhs.end, rhs: rhs.end, compare: ==) else { return false }
    return true
  }
  
  
  /// Interaction start
  public let start: Date
  
  /// Interaction end
  public let end: Date?
  
  /// Line ID
  public let line: Int
  
  /// Desk ID
  public let desk: Int?
  
  /// User ID
  public let user: Int?
}

let now = Date()
let yDay = Calendar.current.date(byAdding: .day, value: -1, to: now)

let interactions = [Interaction(start: yDay!, end: yDay, line: 1, desk: 3, user: 4), Interaction(start: Date(), end: now, line: 1, desk: 3, user: 4)]

let sorted = interactions.sorted(by: { $0 == $1 })

sorted


struct Line {
  var id: Int
  var name: String
  var location: Int?
}

extension Line: Equatable {
  public static func == (lhs: Line, rhs: Line) -> Bool {
    return lhs.id == rhs.id
  }
}

let linea = Line(id: 1, name: "Name", location: 8)
let lineb = Line(id: 2, name: "Name", location: 8)

linea == lineb
