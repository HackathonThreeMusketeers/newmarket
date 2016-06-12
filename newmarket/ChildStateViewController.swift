//
//  ChildStateViewController.swift
//  newmarket
//
//  Created by 会津慎弥 on 2016/06/11.
//  Copyright © 2016年 tsuka-mac-mini. All rights reserved.
//

import UIKit

class ChildStateViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var childStateTableView: UITableView!
    let request = Request()
    var timer: NSTimer!
    var items_id: NSMutableArray = NSMutableArray()
    var items_name: NSMutableArray = NSMutableArray()
    var items_date: NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // DataSourceの設定.
        childStateTableView.dataSource = self
        
        // Delegateを設定.
        childStateTableView.delegate = self


       timer =  NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(self.update(_:)), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
         timer.invalidate()
    }
    
    @objc func update(timer: NSTimer) {
    request.getChildState(setStates)
    }
    
    func setStates(date:NSMutableArray,name:NSMutableArray){
        print("setstate!hoge!")
        self.items_name = name
        self.items_date = date
        childStateTableView.reloadData()
    }
    
    
    //Table Viewのセルの数を指定
    func tableView(table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items_name.count
    }
    
    //各セルの要素を設定する
    func tableView(table: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell:SelectedChildTableViewCell = table.dequeueReusableCellWithIdentifier("StateTableCell", forIndexPath: indexPath) as! SelectedChildTableViewCell
        
        let selectChildCellData = SelectChildCellData(
            item_name: items_name[indexPath.row] as! String,
            item_date: items_date[indexPath.row] as! String
        )
        
        cell.setCell(selectChildCellData)
        
        return cell
    }
    
    //func

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
