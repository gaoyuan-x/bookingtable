//
//  SettingView.swift
//  bookingtable
//
//  Created by 陈玥霓 on 2023/5/13.
//

import UIKit

class SettingView: UIView {
    init(){
        super.init(frame: CGRect.zero)
        innerInit()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        innerInit()
        
    }
    func innerInit(){
        backgroundColor = .white
        addSubview(iconV)
        addSubview(titleV)
        addSubview(arrowV)
    }
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        iconV.snp.makeConstraints{ make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        titleV.snp.makeConstraints{ make in
            make.left.equalTo(iconV.snp.right).offset(16)
            make.centerY.equalToSuperview()
            
        }
        
        arrowV.snp.makeConstraints{ make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.width.equalTo(20)
            make.height.equalTo(20)
            
        }
    }
    lazy var iconV: UIImageView = {
        let r = UIImageView()
        r.image = UIImage(named: "setting")
        return r
    }()
    lazy var arrowV: UIImageView = {
        let r = UIImageView()
        r.image = UIImage(named: "arrow")
        return r
    }()
    lazy var titleV: UILabel = {
        let r = UILabel()
        r.text = "follow"
        return r
    }()
    
}
