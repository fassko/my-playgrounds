//: Playground - noun: a place where people can play

import UIKit
import Foundation

protocol DataProtocol {
  associatedtype Data
  static var dataContainer: WritableKeyPath<Self, Data> { get }
}

extension DataProtocol {
  
  var dataObject: Data {
    return self[keyPath: Self.dataContainer]
  }
  
  func getData() -> Data {
    return self[keyPath: Self.dataContainer]
  }
}

func getData<T: DataProtocol>(object: T) -> T.Data {
  return object[keyPath: T.dataContainer]
}

struct Users: DataProtocol {
  static var dataContainer = \Users.data
//  static let dataContainer = \Users.data
  var statusCode: Int
  var data: [User]
}

struct User {
  var id: Int
  var name: String
}

struct Desks: DataProtocol {
  static var dataContainer = \Desks.desks
//  var dataContainer = \Desks.desks
  var statusCode: Int
  var desks: [Desk]
}

struct Desk {
  var id: Int
  var name: String
}

let u = Users(statusCode: 200, data: [User(id: 1, name: "Kristaps")])
getData(object: u)
u.dataObject
u[keyPath: Users.dataContainer]
u.getData()

let d = Desks(statusCode: 200, desks: [Desk(id: 1, name: "Desk1")])
d[keyPath: Desks.dataContainer]
d.dataObject
u.getData()
