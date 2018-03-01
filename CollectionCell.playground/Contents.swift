//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyCollectionViewCell: UICollectionViewCell {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.backgroundColor = .gray
    
    
    
//    stackView.addArrangedSubview(deskStackView)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// Present the view controller in the Live View window
//PlaygroundPage.current.liveView = MyViewController()
PlaygroundPage.current.needsIndefiniteExecution = true
let cell = MyCollectionViewCell(frame: CGRect(x: 150, y: 150, width: 600, height: 60))
PlaygroundPage.current.liveView = cell

cell.translatesAutoresizingMaskIntoConstraints = true


let stackView = UIStackView()
stackView.axis = .vertical
stackView.distribution = .fillProportionally
cell.addSubview(stackView)

stackView.translatesAutoresizingMaskIntoConstraints = true
stackView.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 20).isActive = true
stackView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 20).isActive = true
stackView.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: 20).isActive = true
stackView.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: 20).isActive = true


let nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
nameLabel.text = "Jonathan B."
stackView.addArrangedSubview(nameLabel)

cell.contentView.addSubview(nameLabel)
