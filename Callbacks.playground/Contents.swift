//: Playground - noun: a place where people can play

import Foundation
import XCPlayground

//XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

struct Ticket {
  var id: Int
}

struct TVDevice {
  var id: Int
}

enum EventType: String {
  case ticketCreate = "TICKET_CREATED"
  case ticketCalled = "TICKET_CALLED"
  case ticketRecalled = "TICKET_RECALLED"
  case ticketCancelled = "TICKET_CANCELLED"
  case ticketServed = "TICKET_SERVED"
  case ticketChanged = "TICKET_CHANGED"
  
  case overviewMonitorChange = "OVERVIEW_MONITOR_CHANGE"
}

enum QminderEventError {
  case unknown
}

enum QminderEventResultGeneric<T> {
  case success(T)
  case failure(Error)
}

let e = QminderEventResultGeneric<Ticket>.success(Ticket(id: 333))

switch e {
  case .success(let ticket):
    print(ticket)
  case .failure(let error):
    print(error)
}

typealias CallbackTypeGeneric = (QminderEventResultGeneric<Ticket>) -> Void

var callbackMapGeneric = [String:CallbackTypeGeneric]()

func subscribeGeneric(id: String, type: EventType, callback: @escaping (QminderEventResultGeneric<Ticket>) -> Void) {
  callbackMapGeneric[id] = callback
  
  switch type {
  case .ticketCalled:
    callback(QminderEventResultGeneric<Ticket>.success(Ticket(id: 666)))
  default:
    return
  }
}

//func subscribeGeneric(id: String, type: EventType, callback: @escaping (QminderEventResultGeneric<TVDevice>) -> Void) {
//  //  callbackMapGeneric[id] = callback
//
//  switch type {
//  case .ticketCalled:
//    callback(QminderEventResultGeneric<Ticket>.success(TVDevice(id: 666)))
//  default:
//    return
//  }
//}

subscribeGeneric(id: "generic", type: .ticketCalled, callback: { result in
  switch result {
  case .success(let ticket):
    print(ticket)
  case .failure(let error):
    print(error)
  }
})


enum QminderEventResult {
  case ticket(Ticket)
  case device(TVDevice)
  
  case failure(QminderEventError)
}

typealias CallbackType = (QminderEventResult) -> Void

var callbackMap = [String:CallbackType]()


func subscribe(id: String, type: EventType, callback: @escaping CallbackType) {
  callbackMap[id] = callback

  switch type {
  case .ticketCalled:
    callback(QminderEventResult.ticket(Ticket(id: 111)))
  case .overviewMonitorChange:
    callback(QminderEventResult.device(TVDevice(id: 444)))
  default:
    callback(QminderEventResult.failure(QminderEventError.unknown))
  }
}




subscribe(id: "id", type: EventType.ticketCalled, callback: {result in
  switch result {
    case .ticket(let ticket):
      print(ticket)
    case .failure(let error):
      print(error)
    default:
      print("Default")
  }
})

subscribe(id: "ids", type: EventType.overviewMonitorChange, callback: {result in
  switch result {
  case .device(let device):
    print(device)
  case .failure(let error):
    print(error)
  default:
    print("Default2")
  }
})

subscribe(id: "error", type: EventType.ticketCancelled, callback: {result in
  switch result {
  case .device(let device):
    print(device)
  case .failure(let error):
    print(error)
  default:
    print("Default3")
  }
})
