//
//  ChildStateViewController.swift
//  newmarket
//
//  Created by 会津慎弥 on 2016/06/11.
//  Copyright © 2016年 tsuka-mac-mini. All rights reserved.
//

import UIKit

class ChildStateViewController: UIViewController {

    @IBOutlet weak var childStateTableView: UITableView!
    let request = Request()
    var timer: NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        
        childStateTableView.reloadData()
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
