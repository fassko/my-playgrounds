import UIKit
import PlaygroundSupport

class MyCell: UICollectionViewCell {
    let textLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(textLabel)
        contentView.backgroundColor = .green
      
      print("init")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentView.backgroundColor = .red
      print("prepareForReuse")
    }
}

public extension UICollectionViewCell {
    public static var identifier: String { return String(describing: self) }
}

public extension UICollectionView {
    public func register(_ cell: UICollectionViewCell.Type) {
        register(cell, forCellWithReuseIdentifier: cell.identifier)
    }
    
    public func dequeueReusableCell<CellClass: UICollectionViewCell>(of class: CellClass.Type,
                                    for indexPath: IndexPath,
                                    configure: ((CellClass) -> Void) = { _ in }) -> UICollectionViewCell {
        
        let cell = dequeueReusableCell(withReuseIdentifier: CellClass.identifier,
                                       for: indexPath)
        
        if let typedCell = cell as? CellClass {
            configure(typedCell)
        }
        
        return cell
    }
}

class DataSource: NSObject, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(of: MyCell.self, for: indexPath) { cell in
            cell.textLabel.text = indexPath.description
        }
    }
}

let layout = UICollectionViewFlowLayout()
layout.itemSize = CGSize(width: 100, height: 100)
layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 320, height: 480), collectionViewLayout: layout)
let dataSource = DataSource()
collectionView.register(MyCell.self)
collectionView.dataSource = dataSource
collectionView.reloadData()
collectionView.backgroundColor = .white

PlaygroundSupport.PlaygroundPage.current.liveView = collectionView
