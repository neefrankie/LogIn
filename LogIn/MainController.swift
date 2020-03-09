//
//  MainController.swift
//  LogIn
//
//  Created by 倪卫国 on 2020/3/3.
//  Copyright © 2020 hubot. All rights reserved.
//

import UIKit

class MainController : UITabBarController, UITabBarControllerDelegate {
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
    }
    
//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        print("Trying to select view controller: \(viewController)")
//        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if #available(iOS 13.0, *) {
//            let loginVC = storyboard.instantiateViewController(identifier: "LoginNavVC")
//            
//            loginVC.modalPresentationStyle = .fullScreen
//            loginVC.modalTransitionStyle = .crossDissolve
//
//            present(loginVC, animated: true, completion: nil)
//        } else {
//            // Fallback on earlier versions
//        }
//        
//        return false
//    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

    }
}
