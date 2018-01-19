//
//  ShowVC.swift
//  Regex
//
//  Created by baiwei－mac on 16/12/30.
//  Copyright © 2016年 YuHua. All rights reserved.
//

import UIKit

class ShowVC: UIViewController {
    
    
    let textView = UITextView(frame: CGRect(x: 0, y: 64, width: YHWidth, height: YHHeight-64))
    var province: Province!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func setupView() {
        
        title = province.name
        var str = "省会名称：\(province.name)\n拥有\(province.cities.count)个市\n"
        for city in province.cities {
            str = "\(str)\n市名：\(city.name)\n别名：\(city.alias)\n"
        }
        
        textView.text = str
        textView.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(rawValue: 5))
        textView.textColor = .orange
        textView.isEditable = false
        view.addSubview(textView)
    }

}
