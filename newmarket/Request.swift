//
//  Request.swift
//  newmarket
//
//  Created by 会津慎弥 on 2016/06/11.
//  Copyright © 2016年 tsuka-mac-mini. All rights reserved.
//

import UIKit
import Alamofire

class Request: NSObject {
    
    let baseURL = "https://funhacks.herokuapp.com/"
    
    func postUUID(childUUID: String, callBackClosure:()->Void)->Void{
        Alamofire.request(.GET, baseURL + "parent/" + NSUUID().UUIDString + "/" + childUUID + "/regist")
            .validate()
            .responseJSON { response in
                
                print(response.request)
                print(response)
                callBackClosure()
        }
    }
    
    func getItemList(callBackClosure:(items_id:NSMutableArray, items_name:NSMutableArray)->Void){
        
        Alamofire.request(.GET,baseURL+"items")
            .validate()
            .responseJSON { response in
                guard let object = response.result.value else {
                    return
                }
                let json = JSON(object)
                
                var items_id: NSMutableArray = NSMutableArray()
                var items_name: NSMutableArray = NSMutableArray()
                
                json.forEach { (_, json) in
                    items_id.addObject(json["id"].stringValue)
                    items_name.addObject(json["name"].stringValue)
                }
                
                callBackClosure(items_id: items_id,items_name: items_name)
        }
    }
    
    func postOrderList(callBackClosure:()->Void)->Void{
        
        
    }
}