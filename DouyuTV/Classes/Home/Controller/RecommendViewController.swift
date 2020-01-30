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

    // MARK:- 懒加载属性
    lazy var recommendVM : RecommendViewModel = RecommendViewModel();
    
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
        loadDate();
    }

}

extension RecommendViewController {
    func setupUI(){
        view.addSubview(collectionView);
      
    }
}

extension RecommendViewController{
    private func loadDate(){
            // 0.给父类中的ViewModel进行赋值
//                   baseVM = recommendVM
                   
                   // 1.请求推荐数据
                   recommendVM.requestData {
//                       // 1.展示推荐数据
//                       self.collectionView.reloadData()
                       
                       // 2.将数据传递给GameView
                       var groups = self.recommendVM.anchorGroups
                       
                       // 2.1.移除前两组数据
                       groups.removeFirst()
                       groups.removeFirst()
                       
                       // 2.2.添加更多组
                       let moreGroup = AnchorGroup()
                       moreGroup.tag_name = "更多"
                       groups.append(moreGroup)
                       
//                       self.gameView.groups = groups
//
//                       // 3.数据请求完成
//                       self.loadDataFinished()
                    // 1.展示推荐数据
                                      self.collectionView.reloadData()
                   }
                   
    }
}

extension RecommendViewController : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return recommendVM.anchorGroups.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let group = recommendVM.anchorGroups[section];
        return group.anchors.count;
//        if section == 0 {
//            return 8;
//        }else{
//            return 4;
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let group = recommendVM.anchorGroups[indexPath.section];
//        let anchor = group.anchors[indexPath.row];
        var cell : CollectionBaseCell!;
        if indexPath.section == 0 {
              cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! CollectionNormalCell;
        }else{
             cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath) as! CollectionPrettyCell;
        }
//        cell.anchor = anchor;
    
       cell.anchor = recommendVM.anchorGroups[indexPath.section].anchors[indexPath.item]
        return cell;
    }
    

    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView :CollectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! CollectionHeaderView;
        let group = recommendVM.anchorGroups[indexPath.section];
        headerView.group = group;
        return headerView;
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: kItemW, height: kNormalItemH);
        }else{
//            AnchorModel
//            let anchor = recommendVM.anchorGroups[indexPath.section].anchors[indexPath.item] as! AnchorModel;
//            let cityStr : String = anchor.anchor_city;
//            let cellH : CGFloat;
//            if cityStr.count>1{
//            // 2.所在的城市
//                cellH = KPrettyItemH;
//            }else{
////                cityBtn.isHidden = true;
//                cellH = KPrettyItemH - 14;
//            }
            return CGSize(width: kItemW, height: KPrettyItemH);
        }
    }
}
