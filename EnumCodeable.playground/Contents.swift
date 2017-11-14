//: Playground - noun: a place where people can play

import UIKit

enum Status: String, Decodable {
  case new = "NEW"
  case other
  
  init?(rawValue: String) {
    switch rawValue.lowercased() {
    case "new":
      self = .new
    default:
      self = .other
    }
  }
}

//extension Status {
//
//  enum CodingKeys: String, CodingKey {
//    case status = ""
//  }
//
//  init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//    self = .new
//  }
//}

struct Ticket: Decodable {
  var status: Status
}


let jsonString = "{\"status\": \"OTH\"}"

let jsonData = jsonString.data(using: .utf8)!

do {
  let decoded = try JSONDecoder().decode(Ticket.self, from: jsonData)
  print("decoded:", decoded)
} catch {
  print(error)
}
