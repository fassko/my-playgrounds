import UIKit
import XCPlayground

func isPrime(number: Int) -> Bool {
  if number <  2 { return false }
  let squareRoot = Int(sqrt(Double(number)))
  if squareRoot * squareRoot == number { return false }
  for i in 2..<Int(ceil(sqrt(Double(number)))) {
    if number % i == 0 { return false }
  }
  return true
}

struct UlamSpiral {
  typealias PointCoordinates = (x: Int, y: Int)
  typealias Point = (number: Int, coordinates: PointCoordinates)
  
  private static func pointsAtLevel(level: Int) -> Int {
    guard level >= 0 else { preconditionFailure() }
    switch level {
    case 0: return 1
    default: return level * 8
    }
  }
  
  private static func finalNumberOnLevel(level: Int) -> Int {
    guard level >= 0 else { preconditionFailure() }
    return (0...level).reduce(0) { $0 + pointsAtLevel(level: $1) }
  }
  
  private enum Direction {
    case Up, Down, Left, Right
    func turn() -> Direction {
      switch self {
      case .Up: return .Left
      case .Left: return .Down
      case .Down: return .Right
      case .Right: return .Up
      }
    }
  }
  
  private static func move(direction: Direction, from point: PointCoordinates) -> PointCoordinates {
    switch direction {
    case .Up: return (x: point.x, y: point.y + 1)
    case .Down: return (x: point.x, y: point.y - 1)
    case .Left: return (x: point.x - 1, y: point.y)
    case .Right: return (x: point.x + 1, y: point.y)
    }
  }
  
  private static func shouldTurn(level: Int, pointCoordinates: PointCoordinates, direction: Direction) -> Bool {
    guard level >= 0 else { preconditionFailure() }
    switch direction {
    case .Left: return Int(pointCoordinates.x) * -1 >= level
    case .Right: return Int(pointCoordinates.x) >= level
    case .Up: return Int(pointCoordinates.y) >= level
    case .Down: return Int(pointCoordinates.y) * -1 >= level
    }
  }
  
  //defaults to starting at 1
  static func pointsUpToNumber(endNumber: Int) -> [Point] {
    guard endNumber >= 0 else { preconditionFailure() }
    var level = 0
    var number = 1
    var pointCoordinates = (x: 0, y: 0)
    var direction: Direction = .Right
    var finalNumberOnLevel = UlamSpiral.finalNumberOnLevel(level: level)
    
    var points = [Point]()
    while number <= endNumber {
      if isPrime(number: number) { points.append(Point(number: number, coordinates: pointCoordinates)) }
      
      if number >= finalNumberOnLevel {
        level += 1
        finalNumberOnLevel = UlamSpiral.finalNumberOnLevel(level: level)
      }
      
      if shouldTurn(level: level, pointCoordinates: pointCoordinates, direction: direction) { direction = direction.turn() }
      pointCoordinates = move(direction: direction, from: pointCoordinates)
      number += 1
    }
    return points
  }
}

class UlamView: UIView {
  
  let points: [UlamSpiral.Point]
  
  init(frame: CGRect, points: [UlamSpiral.Point]) {
    self.points = points
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    
    let context = UIGraphicsGetCurrentContext()
    context!.setStrokeColor(UIColor.black.cgColor)
    let scale: CGFloat = 5
    for point in points {
      let x = (bounds.width / 2 + CGFloat(point.coordinates.x) * scale)
      let y = (bounds.height / 2 + CGFloat(point.coordinates.y) * scale)
      context!.fill(CGRect.init(x: x, y: y, width: 3, height: 3))
    }
  }
  
}

let spiralWidth = 1200
let spiralHeight = 1000
let points = UlamSpiral.pointsUpToNumber(endNumber: 32000)
let ulamView = UlamView(frame: CGRect(x: 0, y: 0, width: spiralWidth, height: spiralHeight), points: points)


ulamView.backgroundColor = UIColor.white
XCPlaygroundPage.currentPage.liveView = ulamView
