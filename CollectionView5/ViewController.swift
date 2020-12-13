//
//  ViewController.swift
//  CollectionView5
//
//  Created by SWAhn on 2020/12/12.
//

import UIKit

class ViewController: UIViewController {
    // 1. 일단 outlet을 만들자
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let col: UICollectionView = {
//            let flowLayout = UICollectionViewFlowLayout()
//            flowLayout.scrollDirection = .vertical
//            flowLayout.minimumLineSpacing = 10// (horizontal 경우 각각 cell간의 좌우 간격, veritcal인 경우 상하간격).
//            flowLayout.minimumInteritemSpacing = 0 // hori 경우 상하간격, verti 경우 좌우간격.
//            flowLayout.sectionInset = UIEdgeInsets(top: 52, left: 10, bottom: 55, right: 10) //Section간의 간역설정시 필요.
//
//            let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
//            let halfWidth = UIScreen.main.bounds.width / 2
//            flowLayout.itemSize = CGSize(width: halfWidth - 10, height: halfWidth - 10)
//            // 전체 사이즈
//            cv.translatesAutoresizingMaskIntoConstraints = false
//            cv.backgroundColor = .red
//            return cv
//
//        }()
//
//        let layout = UICollectionViewFlowLayout()
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        let halfWidth = UIScreen.main.bounds.width / 3
//        layout.itemSize(CGSize(width: halfWidth, height: halfWidth))
//        layout.itemSize = CGSize(width: 50, height: 50)
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 0
            
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        //collectionView.delegate = self
        collectionView.dataSource = self
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        let halfWidth = UIScreen.main.bounds.width / 3
        layout.itemSize = (CGSize(width: halfWidth, height: halfWidth))
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        cell.configure(with: UIImage(named: "yoda")!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("tapped me")
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = UIScreen.main.bounds.width / 3
//        return CGSize(width: width, height: width)
//    }
    
    
}
