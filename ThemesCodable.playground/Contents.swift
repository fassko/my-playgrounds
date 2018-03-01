//: Playground - noun: a place where people can play

import UIKit

struct WaitingListTheme: Codable {
  let logoFillColor: Color
  let lineNameColor: Color
  let lineNameFont: Font
  let customLogo: ThemeImage?
  let loadingBackgroundColor: Color
  let offlineBackgroundColor: Color
  let offlineTitleTextColor: Color
  let offlineTitleFont: Font
  let offlineSubTitleTextColor: Color
  let offlineSubTitleFont: Font
  let backgroundViewColor: Color
  let backgroundViewGradientFromColor: Color?
  let backgroundViewGradientToColor: Color?
  let backgroundTrianglesFillColor: Color
  let backgroundTrianglesAlphaGroups: [CGFloat]
  let namesListSeparatorColor: Color
  let nameTextColor: Color
  let newNameTextColor: Color
  let hiNewNameTextColor: Color
  let newNameBackgroundColor: Color
  let calledNameBackgroundColor: Color
  let calledNameAfterBackgroundColor: Color
  let calledNameAfterFontColor: Color
  let calledNameSpacing: CGFloat
  let calledNameAfterSpacing: CGFloat
  let calledNameTextColor: Color
  let calledNameArrowColor: Color
  let calledDeskNumberColor: Color
  let noShowNameTextColor: Color
  let noShowDeskNumberColor: Color
  let waitingCountViewBackgroundColor: Color
  let waitingCountPlusSignColor: Color
  let waitingCounterPlusSignFont: Font
  let waitingCountLabelColor: Color
  let waitingCountLabelFont: Font
  let notificationBackgroundViewColor: Color
  let notificationBackgroundViewGradientFromColor: Color
  let notificationBackgroundViewGradientToColor: Color
  let notificationBackgroundFillColor: Color
  let notificationBackgroundTrianglesAlphaGroups: [CGFloat]
  let notificationCalledNameArrowColor: Color
  let notificationCalledNameColor: Color
  let notificationCalledNameFont: Font
  let notificationCalledDeskNumberFont: Font
  let notificationToFont: Font
  let notificationToColor: Color
  let notificationAvatarFaceColor: Color
  let notificationAvatarBackgroundColor: Color
  let notificationClerkImageBorderColor: Color
  let notificationClerkNameFont: Font
  let notificationClerkNameColor: Color
  let notificationDeskNameFont: Font
  let notificationDeskNameColor: Color
  let notificationSeperatorViewBackgroundColor: Color
  let nameFont: Font
  let nameCellFontSize: [String: CGFloat]
  let nameCellHeight: [String: CGFloat]
  let calledNameFont: Font
  let calledNameDeskNumberFont: Font
  let noShowNameFont: Font
  let noShowDeskNumberFont: Font
  let noShowBackgroundColor: Color
  let turnMissedFont: Font
  let turnMissedFontColor: Color
  let superscriptTextFont: Font
  let superscriptTextFontSize: [String: CGFloat]
  let superscriptTextMargin: [String: CGFloat]
  let nameBoxCornerRadius: [String: CGFloat]
  let emptyStateTextFont: Font
  let emptyStateTextColor: Color
  let closedViewFillColor: Color
  let closedViewTextFont: Font
}

typealias ThemeImage = String

extension ThemeImage {
  var image: UIImage? {
    return UIImage(named: self)
  }
}

protocol ColorProtocol: Codable {
  var code: String { get }
  var alpha: CGFloat? { get }
}

struct Color: ColorProtocol {
  let code: String
  let alpha: CGFloat?
  
  var color: UIColor {
    return UIColor.red
  }
  
  var cgColor: CGColor {
    return color.cgColor
  }
}

protocol FontProtocol: Codable {
  var name: String { get }
  var size: CGFloat? { get }
}

struct Font: FontProtocol {
  let name: String
  let size: CGFloat?
  
  var font: UIFont? {
    guard let fontSize = size else { return nil }
    
    return UIFont(name: name, size: fontSize)
  }
}

do {
  let path = Bundle.main.url(forResource: "standard", withExtension: "json")
  let data = try! Data.init(contentsOf: path!)
  
  let t = try JSONDecoder().decode(WaitingListTheme.self, from: data)
//  let t = try JSONDecoder().decode(WaitingListTheme.self, from: themes.data(using: .utf8)!)
  
  
  print(t)
  print(t.lineNameColor)
  print(t.lineNameColor.color)
  
} catch {
  print(error)
  // Prints "Cannot initialize System from invalid String value caros"
}
