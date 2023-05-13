//
//  SettingController.swift
//  bookingtable
//
//  Created by 陈玥霓 on 2023/5/13.
//

import UIKit

class SettingController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        
        title = "Setting Page"
        
        view.addSubview(settingView)

        
        settingView.snp.makeConstraints{ make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.height.equalTo(55)
        }
    }
    @objc func SettingClick(recognizer:UITapGestureRecognizer){
        print("????")
    }

    lazy var settingView: SettingView = {
        let r = SettingView()
        r.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SettingClick(recognizer:))))
        return r
    }()
    

}
