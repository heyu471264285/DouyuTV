//
//  UIBarButtonItem-Extension.swift
//  DouyuTV
//
//  Created by mac on 2019/12/31.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    convenience  init(imageName:String,highImageName:String = "",size:CGSize = CGSize.zero) {
        let btn = UIButton();
        btn.setImage(UIImage(named: imageName), for: UIControl.State());
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: .highlighted);
        }
        if size==CGSize.zero {
            btn.sizeToFit();
        }else{
            btn.frame = CGRect(origin: CGPoint.zero, size: size);
        }
        self.init(customView:btn);
    }
//    - (UINavigationBar *)tempNavigationBar{
//        if (!_tempNavigationBar) {
//            _tempNavigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 64)];
//            _tempNavigationBar.translucent = NO;
//            [_tempNavigationBar setTintColor:[UIColor whiteColor]];
//        }
//        return _tempNavigationBar;
//    }
}


