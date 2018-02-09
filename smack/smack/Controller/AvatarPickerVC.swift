//
//  AvatarPickerVC.swift
//  smack
//
//  Created by Duong Dang Hoang on 9/2/18.
//  Copyright © 2018 Duong Dang Hoang. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var segmentedBtn: UISegmentedControl!
    @IBOutlet weak var avatarCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarCollection.delegate = self
        avatarCollection.dataSource = self
    }

    @IBAction func segmentedBtnValueChanged(_ sender: Any) {
        avatarCollection.reloadData()
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarCell{
            if segmentedBtn.selectedSegmentIndex == 0{
                cell.configCell(index: indexPath.item, type: .dark)
            }else{
                cell.configCell(index: indexPath.item, type: .light)
            }
            
            return cell
        }
        
        return AvatarCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfRow: CGFloat = view.bounds.size.width > 320 ? 4 : 3

        let totalInset: CGFloat = 20
        let totalCellSpacing: CGFloat = numberOfRow * 10
        let cellWidth = (collectionView.bounds.size.width - totalInset - totalCellSpacing) / numberOfRow
        
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if segmentedBtn.selectedSegmentIndex == 0{
            UserDataService.instance.setAvatarName(avatarName: "dark\(indexPath.item)")
        }else{
            UserDataService.instance.setAvatarName(avatarName: "light\(indexPath.item)")
        }
        
        dismiss(animated: true, completion: nil)
    }
}
