//
//  OrderListViewController.swift
//  newmarket
//
//  Created by 会津慎弥 on 2016/06/11.
//  Copyright © 2016年 tsuka-mac-mini. All rights reserved.
//

import UIKit

class OrderListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let request = Request()
    var items_id: NSMutableArray = NSMutableArray()
    var items_name: NSMutableArray = NSMutableArray()
    var items_count: NSMutableArray = NSMutableArray()
    
    @IBOutlet weak var itemListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        request.getItemList(setitems)
        
        items_count = NSMutableArray()
        
        // DataSourceの設定.
        itemListTableView.dataSource = self
        
        // Delegateを設定.
        itemListTableView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setitems(items_id:NSMutableArray,items_name:NSMutableArray){
        self.items_id = items_id
        self.items_name = items_name
        
        for i in 0 ..< self.items_id.count {
            self.items_count.addObject("0")
        }
        
        itemListTableView.reloadData()
    }
    
    //Table Viewのセルの数を指定
    func tableView(table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items_id.count
    }
    
    //各セルの要素を設定する
    func tableView(table: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell:SelectOrderTableViewCell = table.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath) as! SelectOrderTableViewCell
        
        let selectOrderCellData = SelectOrderCellData(item_name: items_name[indexPath.row] as! String, item_count: items_count[indexPath.row] as! String)
        
        cell.setCell(selectOrderCellData)
        
        return cell
    }
    
    
    @IBAction func minusButtonAction(sender: AnyObject) {
        
        let botton = sender as! UIButton
        let cell = botton.superview?.superview as! SelectOrderTableViewCell
        
        // クリックされたcellの位置を取得
        let row = itemListTableView.indexPathForCell(cell)?.row
        
        if let nowCount = Int(cell.itemCountLabel.text!){
            if(nowCount != 0){
                cell.itemCountLabel.text = String(nowCount - 1)
                self.items_count[row!] = String(nowCount - 1)
            }
        }
    }
    
    @IBAction func plusButtonAction(sender: AnyObject) {
        
        let botton = sender as! UIButton
        let cell = botton.superview?.superview as! SelectOrderTableViewCell
        
        // クリックされたcellの位置を取得
        let row = itemListTableView.indexPathForCell(cell)?.row
        
        if let nowCount = Int(cell.itemCountLabel.text!){
            cell.itemCountLabel.text = String(nowCount + 1)
            items_count[row!] = String(nowCount + 1)
        }
        
    }
    
    
    @IBAction func completeButtonAction(sender: AnyObject) {
        
        self.performSegueWithIdentifier("Confirm", sender: "")
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(sender?.dynamicType != UIButton.self){
        let viewController = segue.destinationViewController as! OrderConfirmViewController
        
        var sendItemID = NSMutableArray()
        var sendItemName = NSMutableArray()
        var sendItemCount = NSMutableArray()
        
        for i in 0 ..< self.items_id.count {
            
            if(self.items_count[i] as! String != "0"){
                sendItemID.addObject(self.items_id[i])
                sendItemName.addObject(self.items_name[i])
                sendItemCount .addObject(self.items_count[i])
            }
            
        }
        
        viewController.items_id = sendItemID
        viewController.items_name = sendItemName
        viewController.items_count = sendItemCount
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
