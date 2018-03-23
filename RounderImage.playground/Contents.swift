//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let view = UIView(frame: CGRect.init(x: 0, y: 0, width: 400, height: 400))
view.backgroundColor = .white

let borderWitdh: CGFloat = 6

let rounderView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
rounderView.backgroundColor = .clear
rounderView.layer.cornerRadius = rounderView.frame.width * 0.5
rounderView.layer.borderColor = UIColor.red.cgColor
rounderView.layer.borderWidth = borderWitdh
rounderView.layer.masksToBounds = true

view.addSubview(rounderView)

let image = UIImage(named: "image")

let imageView = UIImageView.init(frame: CGRect(x: borderWitdh, y: borderWitdh, width: rounderView.frame.width - borderWitdh * 2, height: rounderView.frame.height - borderWitdh * 2))
imageView.image = image
imageView.contentMode = .scaleAspectFill
imageView.layer.cornerRadius = imageView.frame.height * 0.5
imageView.layer.masksToBounds = true

rounderView.addSubview(imageView)


PlaygroundPage.current.liveView = view
