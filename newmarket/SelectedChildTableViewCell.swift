//
//  SelectedChildTableViewCell.swift
//  newmarket
//
//  Created by 矢野颯太 on 2016/06/12.
//  Copyright © 2016年 tsuka-mac-mini. All rights reserved.
//

import UIKit

class SelectedChildTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemCountLabel: UILabel!
    
    
    func setCell(selectOrderCellData: SelectOrderCellData){
        itemNameLabel.text = selectOrderCellData.item_name
        itemCountLabel.text =
            selectOrderCellData.item_count
    }
    
}

