//: Playground - noun: a place where people can play

import Cocoa

struct Ticket {
  var id: String
  var status: String
}

func !=(lhs: Ticket, rhs: Ticket) -> Bool {
  return lhs.id != rhs.id && lhs.status != rhs.status
}

let a = Ticket(id: "1", status: "NEW")
let b = Ticket(id: "1", status: "CALLED")

a != b

//let urlComponents = URLComponents(string: "http://www.qminder.com")
//
////urlComponents.
//
//let parameters : [String: Any] = ["locationId": 1, "query": "by"]
//
//var items = [URLQueryItem]()
//
//parameters.forEach({key, value in
//  items.append(URLQueryItem(name: key, value: String.init(describing: value)))
//})
//
//print(items)


//extension String {
//  static func random(length: Int) -> String {
//    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
//    let randomLength = UInt32(letters.characters.count)
//
//    let randomString: String = (0 ..< length).reduce(String()) { accum, _ in
//      let randomOffset = arc4random_uniform(randomLength)
//      let randomIndex = letters.index(letters.startIndex, offsetBy: Int(randomOffset))
//      return accum.appending(String(letters[randomIndex]))
//    }
//
//    return randomString
//  }
//}
//
//print(String.random(length: 30))
//
//
//protocol Ticketable {
//  var id: Int { get }
//}
//
//struct Ticket: Ticketable {
//  var id: Int
//
//}
//
//
//var ticket = Ticket(id: 123)
//
//ticket.id = 11
//
//ticket
//
//
//"2013-07-03T16:27Z".count
//
//extension Ticket {
//  func createQTicket() -> QTicket {
//    let qTicket = QTicket(id: self.id, name: "testName")
//
//    return qTicket
//  }
//}
//
//struct QTicket: Ticketable {
//  var id: Int
//
//  var name: String
//}
//
//let qTicket = ticket.createQTicket()
//
//
//let tickets = [ticket, ticket, ticket]
//
//print(tickets.flatMap({ $0.createQTicket() }))
//
//
//protocol A {
//  var variable: Int { get }
//}
//
//
//
//
//
//
//
