//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var retrycount = 0

let timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: { timer in
  print("timeris \(retrycount)")
  retrycount += 1
})

Timer.scheduledTimer(withTimeInterval: 30, repeats: false) { _ in
  timer.invalidate()
}
