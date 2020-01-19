//
//  RecommendViewController.swift
//  DouyuTV
//
//  Created by mac on 2020/1/17.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

private let kItemMargin : CGFloat = 10;
private let kItemW = (kScreenW - 3 * kItemMargin)/2;
private let kNormalItemH = kItemW * 3/4;
private let KPrettyItemH = kItemW * 4/3;
private let kHeaderViewH : CGFloat = 50;
private let kNormalCellID = "kNormalCellID";
private let kPrettyCellID = "kPrettyCellID";
private let kHeaderViewID = "kHeaderViewID";


class RecommendViewController: UIViewController {

     lazy var collectionView : UICollectionView = {[unowned self] in
        let layout = UICollectionViewFlowLayout();
        layout.itemSize = CGSize(width: kItemW, height: kNormalItemH);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = kItemMargin;
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH);
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin);
        
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout);
        collectionView.backgroundColor = UIColor.white;
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.autoresizingMask = [.flexibleHeight,.flexibleWidth];
        

        collectionView.register(UINib(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellID)
         collectionView.register(UINib(nibName: "CollectionPrettyCell", bundle: nil), forCellWithReuseIdentifier: kPrettyCellID)
        

        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kHeaderViewID);
        
        
        return collectionView;
        
    }();
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.addSubview(collectionView);

        setupUI();
    }

}

extension RecommendViewController {
    func setupUI(){
        view.addSubview(collectionView);
      
    }
}

extension RecommendViewController : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 8;
        }else{
            return 4;
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell : UICollectionViewCell;
        if indexPath.section == 0 {
              cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath);
        }else{
             cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath);
        }
       
        return cell;
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12;
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath);
        return headerView;
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: kItemW, height: kNormalItemH);
        }else{
            return CGSize(width: kItemW, height: KPrettyItemH);
        }
    }
}
