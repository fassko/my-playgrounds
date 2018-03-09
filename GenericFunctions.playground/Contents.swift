//: Playground - noun: a place where people can play

import UIKit

enum Result<Value> {
  
  /// Success
  case success(Value)
  
  /// Failure with Error
  case failure
}


struct TestGeneric {
  func makeRequest<Value>() -> Result<Value> {
    
    
    return Result.failure
  }
}

func generic<Value>() -> Result<Value> {
  return Result.failure
}

