//: Playground - noun: a place where people can play

import UIKit
import Foundation

// ------ Protocols

protocol DataProtocol {
  associatedtype Data
  static var dataContainer: WritableKeyPath<Self, Data> { get }
  
  var dataObject: Data { get }
}

extension DataProtocol {
  var dataObject: Data {
    return self[keyPath: Self.dataContainer]
  }
}

/// -- Users

struct Users: DataProtocol {
  static var dataContainer = \Users.data
  
  var statusCode: Int
  var data: [User]
}

struct User {
  var id: Int
  var name: String
}

// Desks

struct Desks: DataProtocol {
  static var dataContainer = \Desks.desks
  
  var statusCode: Int
  var desks: [Desk]
}

struct Desk {
  var id: Int
  var name: String
}


// -- Parsing

let u = Users(statusCode: 200, data: [User(id: 1, name: "Kristaps")])
u[keyPath: Users.dataContainer]

u.dataObject

u.data


let d = Desks(statusCode: 200, desks: [Desk(id: 1, name: "Desk1")])
d[keyPath: Desks.dataContainer]

d.desks

d.dataObject
