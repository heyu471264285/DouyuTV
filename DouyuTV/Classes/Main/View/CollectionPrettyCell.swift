//
//  CollectionPrettyCell.swift
//  DouyuTV
//
//  Created by mac on 2020/1/19.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class CollectionPrettyCell: CollectionBaseCell {

    
    // MARK:- 控件属性
    @IBOutlet weak var cityBtn: UIButton!
    
    // MARK:- 定义模型属性
    override var anchor : AnchorModel? {
        didSet {
            // 1.将属性传递给父类
            super.anchor = anchor
            
            let cityStr : String = anchor!.anchor_city;
            if cityStr.count>1{
            // 2.所在的城市
                cityBtn.isHidden = false;
            cityBtn.setTitle(anchor?.anchor_city, for: UIControl.State())
            }else{
                cityBtn.isHidden = true;
            }
        }
    }

}
