//
//  UUIDResisterViewController.swift
//  newmarket
//
//  Created by 会津慎弥 on 2016/06/11.
//  Copyright © 2016年 tsuka-mac-mini. All rights reserved.
//

import UIKit
import CoreBluetooth

class UUIDResisterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CBCentralManagerDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    var myUuids: NSMutableArray = NSMutableArray()
    var myNames: NSMutableArray = NSMutableArray()
    var myPeripheral: NSMutableArray = NSMutableArray()
    var myCentralManager: CBCentralManager!
    
    let request = Request()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Cellの登録.
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        // DataSourceの設定.
        myTableView.dataSource = self
        
        // Delegateを設定.
        myTableView.delegate = self
        
        // 配列をリセット.
        myNames = NSMutableArray()
        myUuids = NSMutableArray()
        myPeripheral = NSMutableArray()
        
        myCentralManager = CBCentralManager(delegate: self, queue: nil, options: nil)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func centralManagerDidUpdateState(central: CBCentralManager) {
        
        print("state \(central.state)");
        
        switch (central.state) {
        case .PoweredOff:
            print("Bluetoothの電源がOff")
        case .PoweredOn:
            print("Bluetoothの電源はOn")
            
            // BLEデバイスの検出を開始.
            myCentralManager.scanForPeripheralsWithServices(nil, options: nil)
            
        case .Resetting:
            print("レスティング状態")
            
        case .Unauthorized:
            print("非認証状態")
            
        case .Unknown:
            print("不明")
            
        case .Unsupported:
            print("非対応")
        }
    }
    
    /*
     BLEデバイスが検出された際に呼び出される.
     */
    func centralManager(central: CBCentralManager, didDiscoverPeripheral peripheral: CBPeripheral, advertisementData: [String : AnyObject], RSSI: NSNumber) {
        
        print("pheripheral.name: \(peripheral.name)")
        
        print("advertisementData:\(advertisementData)")
        print("RSSI: \(RSSI)")
        print("peripheral.identifier.UUIDString: \(peripheral.identifier.UUIDString)")
        
        var name: NSString? = advertisementData["kCBAdvDataLocalName"] as? NSString
        
        if (name == nil) {
            name = "no name";
        }
        
        myNames.addObject(name!)
        myPeripheral.addObject(peripheral)
        myUuids.addObject(peripheral.identifier.UUIDString)
        myTableView.reloadData()
        
    }
    
    /*
     Cellが選択された際に呼び出される.
     */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print("Num: \(indexPath.row)")
        
        print("Uuid: \(myUuids[indexPath.row])")
        
        print("Name: \(myNames[indexPath.row])")
        
        //Todo UUIDを投げる
        request.postUUID(myUuids[indexPath.row] as! String, callBackClosure: completeUUIDResister)
        
    }
    
    func completeUUIDResister(){
        self.performSegueWithIdentifier("BackMain", sender: "")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let viewController = segue.destinationViewController as! MainViewController
    }
    
    /*
     Cellの総数を返す.
     */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myUuids.count
    }
    
    /*
     Cellに値を設定する.
     */
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier:"MyCell" )
        
        // Cellに値を設定.
        cell.textLabel!.sizeToFit()
        cell.textLabel!.textColor = UIColor.redColor()
        cell.textLabel!.text = "\(myNames[indexPath.row])"
        cell.textLabel!.font = UIFont.systemFontOfSize(20)
        
        // Cellに値を設定(下).
        cell.detailTextLabel!.text = "\(myUuids[indexPath.row])"
        cell.detailTextLabel!.font = UIFont.systemFontOfSize(12)
        
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
