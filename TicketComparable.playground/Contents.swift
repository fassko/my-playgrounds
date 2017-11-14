//: Playground - noun: a place where people can play

import Foundation

struct Ticket {
  var created: Date
}

let dateISO8601MillisecondsFormatter = DateFormatter()
dateISO8601MillisecondsFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

let tickets = [
  Ticket(created: dateISO8601MillisecondsFormatter.date(from: "2017-02-06T12:35:29.123Z")!),
  Ticket(created: dateISO8601MillisecondsFormatter.date(from: "2017-02-06T12:35:29.124Z")!),
  Ticket(created: dateISO8601MillisecondsFormatter.date(from: "2017-02-06T12:35:29.125Z")!),
  Ticket(created: dateISO8601MillisecondsFormatter.date(from: "2017-02-06T12:35:29.126Z")!),
]

extension Ticket: Comparable {
  
  // Equatable
  public static func ==(lhs: Ticket, rhs: Ticket) -> Bool {
    switch lhs.created.compare(rhs.created) {
    case .orderedAscending:
      return false
    case .orderedDescending:
      return false
    case .orderedSame:
      return true
    }
  }
  
  // Comparable
  public static func <(lhs: Ticket, rhs: Ticket) -> Bool {
    switch lhs.created.compare(rhs.created) {
    case .orderedAscending:
      return true
    case .orderedDescending:
      return false
    case .orderedSame:
      return false
    }
  }
}

extension Ticket: CustomStringConvertible {
  var description: String {
    let dateISO8601MillisecondsFormatter = DateFormatter()
    dateISO8601MillisecondsFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    
    return dateISO8601MillisecondsFormatter.string(from: created)
  }
}

tickets.sorted(by: { $0 < $1 }).forEach({ticket in
  print(ticket)
})
