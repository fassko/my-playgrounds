//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
import PlaygroundSupport

extension UIView {
  func fadeIn(duration: TimeInterval = 3.0, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
    UIView.animate(withDuration: duration, animations: {
      self.alpha = 1.0
    }, completion: completion)
//    UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveLinear, animations: {
//      self.alpha = 1.0
//    }, completion: completion)
  }
  
  func fadeOut(duration: TimeInterval = 2.0, delay: TimeInterval = 3.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
    UIView.animate(withDuration: duration, animations: {
      self.alpha = 0.0
    }, completion: completion)
    
  }
}

let liveView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 400, height: 400)))
PlaygroundPage.current.liveView = liveView

let newView = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
newView.backgroundColor = UIColor.blue
newView.alpha = 0

liveView.addSubview(newView)
newView.fadeIn { _ in newView.fadeOut{ _ in newView.fadeIn() } }
