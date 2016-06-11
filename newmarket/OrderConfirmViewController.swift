//
//  OrderConfirmViewController.swift
//  newmarket
//
//  Created by 会津慎弥 on 2016/06/11.
//  Copyright © 2016年 tsuka-mac-mini. All rights reserved.
//

import UIKit

class OrderConfirmViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var seletectedTableView: UITableView!
    
    let request = Request()
    
    var items_id: NSMutableArray = NSMutableArray()
    var items_name: NSMutableArray = NSMutableArray()
    var items_count: NSMutableArray = NSMutableArray()
    
    @IBOutlet weak var sendButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seletectedTableView.delegate = self
        seletectedTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sendButtonAction(sender: UIButton) {
        if(sender == sendButton){
            var myDict:NSMutableDictionary = NSMutableDictionary()
            
            for i in 0 ..< items_id.count{
                myDict.setObject(items_count[i] as! String, forKey: items_id[i] as! String)
            }
            
            let sendDict = [
                "items" : myDict
            ]
            
            print(sendDict)
            
            request.postOrderList(sendDict,callBackClosure: sendCompleted)
        }
    }
    
    
    
    func sendCompleted() {
        self.performSegueWithIdentifier("State", sender: "")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       if(sender?.dynamicType != UIButton.self){
        let viewController = segue.destinationViewController as! ChildStateViewController
        }
    }
    
    //Table Viewのセルの数を指定
    func tableView(table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items_id.count
    }
    
    //各セルの要素を設定する
    func tableView(table: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell:SelectedOrderTableViewCell = table.dequeueReusableCellWithIdentifier("SelectedTableCell", forIndexPath: indexPath) as! SelectedOrderTableViewCell
        
        let selectOrderCellData = SelectOrderCellData(item_name: items_name[indexPath.row] as! String, item_count: items_count[indexPath.row] as! String)
        
        cell.setCell(selectOrderCellData)
        
        return cell
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
