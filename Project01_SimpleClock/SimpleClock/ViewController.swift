//
//  ViewController.swift
//  SimpleClock
//
//  Created by baiwei－mac on 16/11/30.
//  Copyright © 2016年 YuHua. All rights reserved.
//
//  Modified By miscy210 for readapted to Swfit 4

import UIKit

class ViewController: UIViewController {

    
    let showLabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: YHScreenWidth, height: YHScreenHeight/2))
    let begin = UIButton(frame: CGRect(x: 0.0, y: YHScreenHeight/2, width: YHScreenWidth/2, height: YHScreenHeight/2))
    let pause = UIButton(frame: CGRect(x: YHScreenWidth/2, y: YHScreenHeight/2, width: YHScreenWidth/2, height: YHScreenHeight/2))
    var time : Timer?
    var n = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func setupView(){
        showLabel.backgroundColor = .yellow
        begin.backgroundColor = .orange
        pause.backgroundColor = .blue
        begin.setTitle("Begin", for: .normal)
        begin.setTitle("Stop", for: .selected)
        pause.setTitle("Pause", for: .normal)
        pause.setTitle("Resume", for: .selected)
        [begin, pause].forEach{
            ($0.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside))
        }
        
        showLabel.text = "0"
        showLabel.textColor = .white
        showLabel.font = UIFont.systemFont(ofSize: YHScreenHeight/4, weight: UIFont.Weight(rawValue: YHScreenWidth/4))
        showLabel.textAlignment = .center
        view.addSubview(showLabel)
        view.addSubview(begin)
        view.addSubview(pause)
    }
    
    @objc func buttonTapped(sender:UIButton){
        switch sender{
        case begin:
            begin.isSelected = !begin.isSelected
            begin.isSelected ? beginSC() : stopSC()
        case pause:
            if begin.isSelected{
                pause.isSelected = !pause.isSelected
                pause.isSelected ? pauseSC() : resumeSC()
            }else{
                return
            }
        default:
            break
        }
    }
    
    func beginSC(){
        time = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeLabel), userInfo: nil, repeats: true)
    }
    
    func stopSC(){
        showLabel.text = "0"
        time?.invalidate()
        time = nil
        n = 0
        pause.isSelected = false
    }
    
    func pauseSC(){
        if !begin.isSelected{
            return
        }
        time?.invalidate()
        time = nil
    }
    
    func resumeSC(){
        if !begin.isSelected{
            return
        }
        beginSC()
    }
    
    @objc func changeLabel(){
        n += 1
        showLabel.text = String(n)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

