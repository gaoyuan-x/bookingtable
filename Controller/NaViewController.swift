
import UIKit

class HMTNavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true


        }

        self.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
        super.pushViewController(viewController, animated: animated)
    }


    @objc func popToParent() {
        
        popViewController(animated: true)
    }

}
