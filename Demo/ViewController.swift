//
//  ViewController.swift
//  Demo
//
//  Created by SHIH-YING PAN on 2019/8/4.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    func configureCellSize() {
        let itemSpace: CGFloat = 3
        let columnCount: CGFloat = 3
        
        let flowLayout = photoCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        
        let width = floor((view.bounds.width - itemSpace * (columnCount-1)) / columnCount)
        flowLayout?.itemSize = CGSize(width: width, height: width)
        
        flowLayout?.estimatedItemSize = .zero
        flowLayout?.minimumInteritemSpacing = itemSpace
        flowLayout?.minimumLineSpacing = itemSpace
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureCellSize()
    }

}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        21
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(PrinceCollectionViewCell.self)", for: indexPath) as! PrinceCollectionViewCell
        
        // Configure the cell
        cell.imageView.image = UIImage(named: "pic\(indexPath.item)")
        return cell
    }
    
    
}
