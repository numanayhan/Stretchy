//
//  MultiSection.swift
//  Stretchy
//
//  Created by na on 7.01.2023.
//

import UIKit

class ListCell : UICollectionViewCell{
    static let reueseId = "ListCell"
    let label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    func configure(){
        label.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        contentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        contentView.layer.cornerRadius = 22
        contentView.addSubview(label)
        selectedBackgroundView = UIView()
        selectedBackgroundView?.layer.cornerRadius = 20
        selectedBackgroundView?.backgroundColor = UIColor.black
        label.centerInSuperview()
    }
    override var isSelected: Bool {
        didSet{
            if self.isSelected {
                UIView.animate(withDuration: 0.2) { // for animation effect
                    self.selectedBackgroundView?.backgroundColor  = .orange
                    self.label.textColor = UIColor.white
                }
            }
            else {
                UIView.animate(withDuration: 0.2) { // for animation effect
                    self.selectedBackgroundView?.backgroundColor  = UIColor.lightGray.withAlphaComponent(0.3)
                    self.label.textColor = UIColor.black
                }
            }
        }
    }
    
}
class MultiSection: UIViewController {
    fileprivate let cellId = "cellId"
    fileprivate let headerId = "headerId"
    let padding: CGFloat = 8
    lazy  var flowLayout : UICollectionViewFlowLayout = {
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        //flowLayout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.minimumLineSpacing = CGFloat(self.padding)
        flowLayout.minimumInteritemSpacing = CGFloat(self.padding)
        //flowLayout.scrollDirection = .vertical
        return flowLayout
    }()
    lazy var collectionView:UICollectionView = {
        let  cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = UIColor.white
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    var collectionSize  = CGSize(width: 0, height: 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollection()
    }
    func setCollection(){
        
        collectionSize = CGSize(width: view.frame.width / 3  - ( padding * 2 ), height: 44)
        view.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior  = .never
        collectionView.backgroundColor = .white
        collectionView.register(ListCell.self, forCellWithReuseIdentifier: cellId)
        view.addSubview(collectionView)
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets.init(top: 54 ,left: padding * 2 , bottom: 0, right: padding * 2 ), size: CGSize.init(width: view.frame.width, height: view.frame.height))
        collectionView.reloadData()
    }
    
}
extension MultiSection : UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    //Count List
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    //Cell Insert
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? ListCell{
            cell.label.text = "Türkçe"
            return cell
        }
        return UICollectionViewCell()
    }
    //Cell Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionSize
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? ListCell
        print(cell!.label.text!)
    }
}
extension MultiSection {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if navigationController != nil{
            navigationController?.setNavigationBarHidden(true, animated: true)
        }
    }
}
