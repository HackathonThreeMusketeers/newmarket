//
//  SelectChildCustomCell.swift
//  newmarket
//
//  Created by 矢野颯太 on 2016/06/12.
//  Copyright © 2016年 tsuka-mac-mini. All rights reserved.
//

import UIKit

class SelectChildCellData: NSObject {
    
    var item_name:String
    var item_date:String
    
    init(item_name:String,item_date:String){
        self.item_date = item_date
        self.item_name = item_name
    }
    
}
