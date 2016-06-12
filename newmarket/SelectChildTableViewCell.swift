//
//  SelectChildTableViewCell.swift
//  newmarket
//
//  Created by 矢野颯太 on 2016/06/12.
//  Copyright © 2016年 tsuka-mac-mini. All rights reserved.
//


import UIKit

class SelectChildTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var name: UILabel!
    
    func setCell(selectChildCellData: SelectChildCellData){
        date.text = selectChildCellData.item_date
        name.text = selectChildCellData.item_name
    }
    
}
