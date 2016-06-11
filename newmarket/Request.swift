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
        Alamofire.request(.POST, baseURL + childUUID + "/" + NSUUID().UUIDString)
    }
    
}
