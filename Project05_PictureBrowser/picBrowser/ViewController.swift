//
//  ViewController.swift
//  PictureBrowse
//
//  Created by baiwei－mac on 16/12/5.
//  Copyright © 2016年 YuHua. All rights reserved.
//

import UIKit

let YHRect = UIScreen.main.bounds
let YHHeight = YHRect.size.height
let YHWidth = YHRect.size.width

let ItemWidth = YHWidth-40.0
let ItemHeight = YHHeight/3.0

class ViewController: UIViewController {
    
    let backgroundImageView = UIImageView(frame: YHRect)
    var collectionView: UICollectionView!
    let data = CollectionModel.createInterests()
    let reuseIdentifier = "CollectionCell"
    let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupView(){
        backgroundImageView.image = UIImage(named:"blue")
        
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.itemSize = CGSize(width: ItemWidth, height: ItemHeight)
        collectionLayout.minimumLineSpacing = 20
        collectionLayout.minimumInteritemSpacing = 20
        collectionLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collectionView = UICollectionView(frame: CGRect(x: 0.0, y: (YHHeight-ItemHeight)/2,width: YHWidth, height: ItemHeight),collectionViewLayout:collectionLayout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
         visualEffectView.frame = YHRect
        
        view.addSubview(backgroundImageView)
        view.addSubview(visualEffectView)
        view.addSubview(collectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

/*
  UITableViewDataSource包含描述表视图将显示多少信息的方法，并将UITableViewCell对象提供给应用程序进行显示。
    numberofSectionsInTableView: 返回表视图将划分成多少个分区
    tableView: numberOfRowsInSection: 返回给定分区包含多少行。
    tableView:titleForHeaderInSection: 返回一个字符串，用作给定分区的标题。
    tableView: cellForRowAtIndexPath: 返回一个经过正确配置的单元格对象，用于显示在表视图指定位置。
  UICollectionViewDataSource是一个代理，主要用于向Collection View提供数据。主要功能如下：
    Section数目
    Section里面有多少item
    提供Cell和Supplementary View设置
    通过一下3个方法实现
        NumberOfSecitonsInCollection
        CollecitonView:numberOfItemsInSection
        CollectionView: cellForItemAtIndexPath
 UICollectionViewLayout是UICollectionView控件的精髓，是与UITableView最大的不同。
 */

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collctionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        // 重用
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionCell
        
        cell.data = self.data[indexPath.row]
        return cell
    }
    
}
