//
//  OrderConfirmViewController.swift
//  newmarket
//
//  Created by 会津慎弥 on 2016/06/11.
//  Copyright © 2016年 tsuka-mac-mini. All rights reserved.
//

import UIKit

class OrderConfirmViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    let request = Request()
    
    var items_id: NSMutableArray = NSMutableArray()
    var items_name: NSMutableArray = NSMutableArray()
    var items_count: NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func sendButtonAction(sender: AnyObject) {
        request.postOrderList(sendCompleted)
    }
    
    func sendCompleted() {
        self.performSegueWithIdentifier("State", sender: "")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let viewController = segue.destinationViewController as! OrderConfirmViewController
        
        
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
