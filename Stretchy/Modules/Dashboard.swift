//
//  Dashboard.swift
//  Stretchy
//
//  Created by na on 5.01.2023.
//

import UIKit

class Dashboard: UIViewController {
    
    fileprivate let cellId = "cellId"
    fileprivate let headerId = "headerId"
    let padding: CGFloat = 16
    lazy  var flowLayout : UICollectionViewFlowLayout = {
       let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        return flowLayout
    }()
    
    lazy var collectionView:UICollectionView = { 
        let  cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = UIColor.white
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollection()
    }
    func setCollection(){
        view.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior  = .never
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        view.addSubview(collectionView)
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets.init(top: 54, left: 0, bottom: 0, right: 0), size: CGSize.init(width: view.frame.width, height: view.frame.height))
         
        collectionView.reloadData()
    } 
    
}
extension Dashboard : UICollectionViewDataSource, UICollectionViewDelegate{
    //Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        return header
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 240)
    }
    //Count List
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    //Cell Insert
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .black
        return cell
    }
    //Cell Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 2 * padding, height: 50)
    }
    
}
extension Dashboard :UICollectionViewDelegateFlowLayout{
    
}
extension Dashboard {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if navigationController != nil{
            navigationController?.setNavigationBarHidden(true, animated: true)
        }
    }
}
