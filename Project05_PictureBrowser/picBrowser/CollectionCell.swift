//
//  ViewController.swift
//  PictureBrowse
//
//  Created by baiwei－mac on 16/12/5.
//  Copyright © 2016年 YuHua. All rights reserved.
//

import Foundation

import UIKit

class CollectionCell: UICollectionViewCell{
    
    let featureImageView = UIImageView(frame: CGRect(x:0.0,y:0.0, width: ItemWidth, height: ItemHeight))
    let interestTitleLabel = UILabel(frame: CGRect(x:0.0, y: ItemHeight-50, width: ItemWidth, height: 20))
    let interestDetailLabel = UILabel(frame: CGRect(x:0.0, y: ItemHeight-30, width: ItemWidth, height:30))
    
    var data: CollectionModel?{
        didSet{
            updateUI()
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        interestTitleLabel.backgroundColor = .gray
        interestTitleLabel.textColor = .white
        interestTitleLabel.textAlignment = .center
        interestTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(rawValue: 4))
        interestDetailLabel.backgroundColor = .white
        interestDetailLabel.textColor = .white
        interestDetailLabel.textAlignment = .center
        interestDetailLabel.numberOfLines = 0
        interestDetailLabel.font = UIFont.systemFont(ofSize: 10)
        contentView.addSubview(featureImageView)
        contentView.addSubview(interestTitleLabel)
        contentView.addSubview(interestTitleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateUI(){
        featureImageView.image = data?.featuredImage
        interestTitleLabel.text = data?.title
        interestDetailLabel.text = data?.descriptions
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5.0
        featureImageView.clipsToBounds = true
    }
    
}
