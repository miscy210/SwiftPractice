//
//  ObjectModel.swift
//  CookBook
//
//  Created by baiwei－mac on 17/1/22.
//  Copyright © 2017年 YuHua. All rights reserved.
//
import UIKit

let YHRect = UIScreen.main.bounds
let YHHeight = YHRect.size.height
let YHWidth = YHRect.size.width
let YHNoNavRect = CGRect(x: 0, y: 0, width: YHWidth, height: YHHeight-64)
let YHNoTarRect = CGRect(x: 0, y: 0, width: YHWidth, height: YHHeight-49)
let YHNoNavTarRect = CGRect(x: 0, y: 0, width: YHWidth, height: YHHeight-64-49)

let mainURL = "http://wp.asopeixun.com:5000/get_post_from_category_id?category_id=159"
let mainMenuURL = "http://wp.asopeixun.com:5000/get_category_list?app_id=1123413756"

struct ShowData {
    
    var jianjie: String
    var tags: String
    var thumb_2: String
    var views: NSInteger
    var title: String
    var thumb: String
    var ID: NSInteger
    var catename: String
    var subcatename: String
    var edittime: String
    var menuTitle: String
    
    static func parseData(data: Any?) -> [ShowData]? {
        if let data = data {
            var result = [ShowData]()
            let dic = data as! NSDictionary
            let arr = dic["list"] as! NSArray
            for content in arr {
                let dic = content as! NSDictionary
                let arr = dic["list"] as! NSArray
                let title = dic["title"] as! String
                for content in arr {
                    let dic = content as! NSDictionary
                    let menu = ShowData(jianjie: dic["jianjie"] as! String,
                                        tags: dic["tags"] as! String,
                                        thumb_2: dic["thumb_2"] as! String,
                                        views: dic["views"]!  as! NSInteger,
                                        title: dic["title"] as! String,
                                        thumb: dic["thumb"] as! String,
                                        ID: dic["ID"]! as! NSInteger,
                                        catename: dic["catename"] as! String,
                                        subcatename: dic["subcatename"] as! String,
                                        edittime: dic["edittime"] as! String,
                                        menuTitle: title)
                    result.append(menu)
                }
                return result
            }
        }
        return nil
    }
}

struct MenuData {
    var title: String
    var type: String
    var apiurl: String
    var icon: String
    
    static func parseData(data: Any?) -> [MenuData]? {
        if let data = data {
            var result = [MenuData]()
            let dic = data as! NSDictionary
            let arr = dic["category"] as! NSArray
            for content in arr {
                let dic = content as! NSDictionary
                var menu = MenuData(title: dic["title"] as! String, type: dic["type"] as! String, apiurl: dic["apiurl"] as! String, icon: dic["icon"] as! String)
                if menu.title == "首页" {
                    menu.apiurl = mainURL
                }
                result.append(menu)
            }
            print(result)
            return result
        }
        return nil
    }
}

