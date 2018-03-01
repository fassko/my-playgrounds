//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 375, height: 600))

containerView.backgroundColor = .white

let stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 375, height: 600))
stackView.axis = .horizontal
stackView.distribution = .fill
stackView.alignment = .center
stackView.spacing = 10
stackView.translatesAutoresizingMaskIntoConstraints = false

containerView.addSubview(stackView)

for i in 1 ..< 5 {
  let button = UIButton(type: .system)
  button.setTitle("view \(i)", for: .normal)
  button.backgroundColor = .gray
  
  stackView.addArrangedSubview(button)
}


PlaygroundPage.current.liveView = containerView
