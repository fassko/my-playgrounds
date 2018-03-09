//: Playground - noun: a place where people can play

import UIKit
import Foundation

enum ApiError: Error {
  case fail
}

enum Result<Value> {
  case success(Value)
  case failure(Error)
}

struct Location {
  var id: Int
  var name: String
}

func getList() {
  request(url: "list", decodeType: Location.self) { location in
    print(location)
  }
}


func request<T>(url: String, decodeType: T, completion: (Result<T>) -> Void) {
  
}
