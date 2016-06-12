//
//  SelectedOrderTableViewCell.swift
//  newmarket
//
//  Created by 会津慎弥 on 2016/06/12.
//  Copyright © 2016年 tsuka-mac-mini. All rights reserved.
//

import UIKit

class SelectedChildTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var name: UILabel!
    
    
    func setCell(selectChildCellData: SelectChildCellData){
        date.text = selectChildCellData.item_name
        name.text = selectChildCellData.item_date
    }
    
}
