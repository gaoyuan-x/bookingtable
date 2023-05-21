//
//  BaseController.swift
//  bookingtable
//
//  Created by 陈玥霓 on 2023/5/14.
//

import UIKit



class BaseController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setupChildController()
        
    }

 

}


// MARK: - fristpage
extension BaseController{
    

    private func setupChildController(){

        var tabbarArray = [[String: Any]]()
        
        tabbarArray = [["className":"RestaurantViewController","title":"Homepage","imageName":"myClient"],
                       ["className":"twoViewController","title":"MY","imageName":"mineZuyuan"],
                       ["className":"twoViewController","title":"My storage","imageName":"storage"]]
        
        
        
        var ctlArray = [UIViewController]()
        for dic in tabbarArray {
            ctlArray.append(newController(dict: dic as [String : AnyObject]))
        }
        viewControllers = ctlArray
        
    }
    
    
    
    //使用字典创建一个子控制器
    private func newController(dict:[String: AnyObject]) -> UIViewController {
        //取得字典内容
        guard let clsName = dict["className"] as? String,
            let title = dict["title"] as? String,
            let imageName = dict["imageName"] as? String,
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type
            else {
                return UIViewController()
        }
        
        //创建视图控制器
        let vc = cls.init()
//        cls.init()

        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_select")?.withRenderingMode(.alwaysOriginal)
        //设置tabbar字体颜色
        vc.title = title
        let nav = HMTNavViewController(rootViewController: vc)
//        vc.navigationItem.title = title
//        let nav = UINavigationController(rootViewController: vc)
        
        return nav
    }


}

extension Bundle {

    var namespace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
