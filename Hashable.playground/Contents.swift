//: Playground - noun: a place where people can play

import UIKit

struct Ticket {
  var id: String
  var name: String
}

extension Ticket: Hashable {
  static func ==(lhs: Ticket, rhs: Ticket) -> Bool {
    return lhs.id == rhs.id && lhs.name == rhs.name
  }
  
  var hashValue: Int {
    return id.hashValue
  }
}

let tickets = [Ticket(id: "1", name: "Test1"), Ticket(id: "1", name: "Test3"), Ticket(id: "2", name: "Test2")]

Set(tickets)
