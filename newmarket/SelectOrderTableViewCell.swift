//
//  SelectOrderTableViewCell.swift
//  newmarket
//
//  Created by 会津慎弥 on 2016/06/12.
//  Copyright © 2016年 tsuka-mac-mini. All rights reserved.
//

import UIKit

class SelectOrderTableViewCell: UITableViewCell {

    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    func setCell(selectOrderCellData: SelectOrderCellData){
        itemNameLabel.text = selectOrderCellData.item_name
        itemCountLabel.text =
        selectOrderCellData.item_count
    }

}
