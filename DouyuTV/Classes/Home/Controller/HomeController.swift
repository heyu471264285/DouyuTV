//
//  HomeController.swift
//  DouyuTV
//
//  Created by mac on 2019/12/30.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

let kTitleViewH:CGFloat = 40;


class HomeController: UIViewController {

    lazy var pageTitleView:PageTitleView =
    {[weak self] in
        let titleFrame = CGRect(x: 0, y: kStatusBarH+kNavigationBarH, width: kScreenW, height: kTitleViewH);
        let titles = ["推荐","游戏","娱乐","趣玩"];
        let titleView  = PageTitleView(frame: titleFrame, titles: titles);
//        titleView.backgroundColor = UIColor.purple;
        titleView.delegate = self;
        return titleView;
        
        
        
    }();
    
     lazy var pageContentView : PageContentView = {[weak self] in
        let contentH = kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH - kTabbarH;
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH);
        var childVcs = [UIViewController]();
        childVcs.append(RecommendViewController());
        for _ in 0..<3{
            let vc = UIViewController();
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)));
            childVcs.append(vc);
            
        }
        
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self);
        contentView.delegate = self;
        return contentView;
        
    }();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        automaticallyAdjustsScrollViewInsets = false;
        self.view.backgroundColor = UIColor.white;
        setupUI();
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeController{
    func setupUI() {
        setupNavigatonBar();
        view.addSubview(pageTitleView);
        view.addSubview(pageContentView);
//        pageContentView.backgroundColor = .red;
    }
    
    func setupNavigatonBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo");
        
        let size = CGSize(width: 40, height: 40);
        let historyItem  = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size);
        let seatchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size);
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size);
        
        navigationItem.rightBarButtonItems = [historyItem,seatchItem,qrcodeItem];
    }
}

extension HomeController : PageTitleViewDelegate{
    func pageTitleView(titleView: PageTitleView, selectedIndex index: Int) {
        print(index);
        pageContentView.setCurrentIndex(currentIndex: index);
    }
    
    
}

extension HomeController : PageContentViewDelegate{
    func pageContentView(contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
//        print("progress=\(progress),sourceIndex=\(sourceIndex),targetIndex=\(targetIndex)");
        pageTitleView.setTitleWithProgress(progress, sourceIndex: sourceIndex, targetIndex: targetIndex);
    }
    
}
