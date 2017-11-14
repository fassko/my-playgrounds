//: Playground - noun: a place where people can play

import Foundation

enum Status: String {
  case new = "NEW"
  case called = "CALLED"
  case cancelled = "CANCELLED"
  case cancelledByClerk = "CANCELLED_BY_CLERK"
  case noShow = "NOSHOW"
  case served = "SERVED"
}

public struct Created {
  public var date: Date
}

extension Created: Comparable {
  public static func ==(lhs: Created, rhs: Created) -> Bool {
    return lhs.date == rhs.date
  }
  
  public static func < (lhs: Created, rhs: Created) -> Bool {
    return lhs.date < rhs.date
  }
}

public struct Called: Codable {
  public var date: Date?
  public var desk: Int?
  public var caller: Int?
}

public struct Served: Codable {
  public let date: Date?
}

extension Served: Comparable {
  public static func ==(lhs: Served, rhs: Served) -> Bool {
    return lhs.date == rhs.date
  }
  
  public static func <(lhs: Served, rhs: Served) -> Bool {
    guard let lhsDate = lhs.date, let rhsDate = rhs.date else { return false }
    
    return lhsDate < rhsDate
  }
}

extension Called: Comparable {
  public static func ==(lhs: Called, rhs: Called) -> Bool {
    return lhs.date == rhs.date
  }
  
  public static func <(lhs: Called, rhs: Called) -> Bool {
    guard let lhsDate = lhs.date, let rhsDate = rhs.date else { return false }
    
    return lhsDate < rhsDate
  }
}


struct Ticket {
  
  var created: Created
  var status: Status
  
  var called: Called?
  var served: Served?
  var orderAfter: Date?
}

let dateFormat = DateFormatter()
dateFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

let tickets = [
  Ticket(created: Created(date: dateFormat.date(from: "2017-02-06T12:35:29.123Z")!), status: .new, called: nil, served: nil, orderAfter: nil),
  Ticket(created: Created(date: dateFormat.date(from: "2017-02-06T12:35:29.124Z")!), status: .called, called: Called(date: dateFormat.date(from: "2017-02-06T14:35:29.124Z")!, desk: nil, caller: nil), served: nil, orderAfter: nil),
  Ticket(created: Created(date: dateFormat.date(from: "2017-02-06T12:35:29.125Z")!), status: .new, called: nil, served: nil, orderAfter: nil),
  Ticket(created: Created(date: dateFormat.date(from: "2017-02-06T12:35:29.126Z")!), status: .new, called: nil, served: nil, orderAfter: nil),
  Ticket(created: Created(date: dateFormat.date(from: "2017-02-06T12:35:29.146Z")!), status: .noShow, called: nil, served: Served(date: dateFormat.date(from: "2017-02-06T12:39:29.146Z")!), orderAfter: nil),
  Ticket(created: Created(date: dateFormat.date(from: "2017-02-06T12:32:29.124Z")!), status: .called, called: Called(date: dateFormat.date(from: "2017-02-06T13:35:29.125Z")!, desk: nil, caller: nil), served: nil, orderAfter: nil),
  Ticket(created: Created(date: dateFormat.date(from: "2017-02-06T12:38:29.146Z")!), status: .noShow, called: nil, served: Served(date: dateFormat.date(from: "2017-02-06T12:58:29.146Z")!), orderAfter: nil),
]

extension Ticket: Comparable {
  
  // Equatable
  public static func ==(lhs: Ticket, rhs: Ticket) -> Bool {
    
    guard lhs.status == rhs.status else { return false }
    guard lhs.created == rhs.created else { return false }
    
    return true
  }
  
  // Comparable
  public static func <(lhs: Ticket, rhs: Ticket) -> Bool {
    
    switch (lhs.status, rhs.status) {
    
    case (.noShow, .noShow):
      return lhs.created < rhs.created
      
    case (.noShow, _) where [.called, .new].contains(rhs.status):
      return true
      
    case (.called, .called):
      guard let lhsCalled = lhs.called, let rhsCalled = rhs.called else { return false }
      
      return lhsCalled < rhsCalled
      
    case (.called, .new):
      return true
      
    case (.new, .new):
      return lhs.orderAfter ?? lhs.created.date < rhs.orderAfter ?? rhs.created.date
      
    default:
      return false
    }
    
    /**
     
     NOSHOW
     * served <
     CALLED
     * called date <
     NEW:
     * order after <
     * created <
     
    */
    
//    // If ticket is called
//    if lhs.status == .noShow {
//      guard let lhsServedDate = lhs.served?.date else {
//        return false
//      }
//
//      // If other one is called then compare called date
//      if rhs.status == .noShow {
//
//        guard let rhsServedDate = rhs.served?.date else {
//          return true
//        }
//
//        return lhsServedDate.compare(rhsServedDate) == ComparisonResult.orderedDescending
//      } else {
//        // CALLED > NEW ticet
//        return true
//      }
//    } else if lhs.status == .called {
//
//      guard let lhsCalledDate = lhs.called?.date else {
//        return false
//      }
//
//      // If other one is called then compare called date
//      if rhs.status == .called {
//
//        guard let rhsCalledDate = rhs.called?.date else {
//          return true
//        }
//
//        return lhsCalledDate.compare(rhsCalledDate) == ComparisonResult.orderedDescending
//      } else {
//        // CALLED > NEW ticet
//        return true
//      }
//    } else {
//
//      // compare order after dates with nanosecond
//
//      let orderAfter0 = lhs.orderAfter ?? (lhs.created?.date)!
//      let orderAfter1 = rhs.orderAfter ?? (rhs.created?.date)!
//
//      return orderAfter0.compare(orderAfter1) == ComparisonResult.orderedAscending
//    }
  }
}

extension Ticket: CustomStringConvertible {
  var description: String {
    let dateFormat = DateFormatter()
    dateFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    
    return status.rawValue + " " + dateFormat.string(from: created.date)
  }
}

tickets.sorted(by: { $0 < $1 }).forEach({ticket in
  print(ticket)
})
