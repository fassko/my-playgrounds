//: Playground - noun: a place where people can play

import UIKit

func sumOf(numbers: [Int]) -> Int {
  var total = 0
  for i in numbers {
    total += i
  }
  return total
}

func sumOf(numbers: Int...) -> Int {
  return sumOf(numbers: numbers)
}

var variadicSum = sumOf(numbers: 1, 2, 3, 4, 5)
var arraySum = sumOf(numbers: [1, 2, 3, 4, 5])
