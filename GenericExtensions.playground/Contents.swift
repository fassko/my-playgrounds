//: Playground - noun: a place where people can play

import Cocoa

struct Ticket {
  var id: Int
}

struct TVDevice {
  var id: Int
}

struct Struct<T> {
  var data: T
}

extension Struct where T == Ticket {
  func drukat() {
    print("Ticket \(data)")
  }
}

extension Struct where T == TVDevice {
  func drukat() {
    print("TVData \(data)")
  }
}

let ticket = Struct<Ticket>(data: Ticket(id: 111))
ticket.drukat()


let device = Struct<TVDevice>(data: TVDevice(id: 333))
device.drukat()
