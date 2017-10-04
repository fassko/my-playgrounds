//: Playground - noun: a place where people can play

import Foundation

var data: [String: Any] = [
  "id" : 999,
  "name" : "Line name",
  "location" : 333
]

let jsonData = try! JSONSerialization.data(withJSONObject: data, options: .sortedKeys)

print(String.init(data: jsonData, encoding: .utf8))
