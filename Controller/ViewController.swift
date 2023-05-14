//
//  ViewController.swift
//  bookingtable
//
//  Created by 陈玥霓 on 2023/5/11.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    var container:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        // container
        self.container = UIView()
        container.backgroundColor = .white
        view.addSubview(container)
        
        //logo
        let logoV = UIImageView()
        logoV.image = UIImage(named: "logo")
        container.addSubview(logoV)
        
        //login
        container.addSubview(account)
        container.addSubview(phonenumber)
        
        //skip
        container.addSubview(skip)
        //statement
        let agrement = UILabel()
        agrement.text = "Log in means you agree to the 'User Agreement'"
        container.addSubview(agrement)
        agrement.textColor = .gray
        agrement.font = UIFont.systemFont(ofSize: 12)
        
        
        //container pos
        container.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(16)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)
        }
        
        //logo pos
        logoV.snp.makeConstraints{ make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.top.equalTo(100)
            make.centerX.equalToSuperview()
            
        }
        //statement pos
        agrement.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        //logbotton pos
        account.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(42)
            make.bottom.equalTo(agrement.snp.top).offset(-30)
        }
        phonenumber.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(42)
            make.bottom.equalTo(account.snp.top).offset(-30)
            
        }
        //skip pos
        skip.snp.makeConstraints{ make in

            make.height.equalTo(42)
            make.bottom.equalTo(logoV.snp.top).offset(-50)
            make.right.equalTo(logoV.snp.right).offset(100)
            
        }
    }
    @objc func phonelogin(_ sender:UIButton){
        print("ViewController phonelogin \(sender.titleLabel!.text!)")
        let v = SettingController()
        navigationController?.pushViewController(v, animated: true)

    }
    @objc func accountlogin(_ sender:UIButton){
        print("ViewController accountlogin \(sender.titleLabel!.text!)")
        
    }
    @objc func skip(_ sender:UIButton){
        let v = BaseController()
        navigationController?.pushViewController(v, animated: true)
    }
    //phone number login botton
    lazy var phonenumber: UIButton = {
        let result = UIButton(type: .system)
        result.setTitle("Using phone number log in", for: .normal)
        
        result.addTarget(self, action: #selector(phonelogin(_:)), for: .touchUpInside)
        
        result.backgroundColor = .red
        
        result.layer.cornerRadius = 5
        
        result.setTitleColor(.white, for: .normal)
        
        result.setTitleColor(.gray, for: .highlighted)
        return result
    }()
    
    lazy var account: UIButton = {
        let result = UIButton(type: .system)
        result.setTitle("Using account log in", for: .normal)
        
        result.addTarget(self, action: #selector(accountlogin(_:)), for: .touchUpInside)
        
        result.backgroundColor = .clear
        
        result.layer.cornerRadius = 21
        
        result.layer.borderWidth = 1
        result.layer.borderColor = UIColor.red.cgColor
        
        result.setTitleColor(.red, for: .normal)
        
        result.setTitleColor(.gray, for: .highlighted)
        return result
        
    }()
    lazy var skip: UIButton = {
        let result = UIButton(type: .system)
        result.setTitle("Skip", for: .normal)
        
        result.addTarget(self, action: #selector(skip(_:)), for: .touchUpInside)
        

        result.setTitleColor(.blue, for: .normal)
        
        result.setTitleColor(.gray, for: .highlighted)
        return result
    }()
    
}


