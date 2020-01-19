//
//  MainTabBarController.swift
//  DouyuTV
//
//  Created by mac on 2019/12/30.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBar.tintColor = UIColor.orange;
        addChildVc(storyName: "Home");
        addChildVc(storyName: "Live");
        addChildVc(storyName: "Follow");
        addChildVc(storyName: "Profile");
    }
    
    func addChildVc(storyName:String) {
        let childVc = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!;
        addChild(childVc);
        
        
    }

}
