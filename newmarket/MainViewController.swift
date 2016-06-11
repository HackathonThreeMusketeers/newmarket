//
//  ViewController.swift
//  newmarket
//
//  Created by tsuka-mac-mini on 2016/06/11.
//  Copyright © 2016年 tsuka-mac-mini. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let request = Request()
    
    @IBOutlet weak var mukuriImageView: UIImageView!
    
    @IBOutlet weak var mainButton: UIButton!
    
    @IBAction func Nextbotton(sender: UIButton) {
        if(sender == mainButton){
            if(sender.imageView!.image == UIImage(named: "miruki.png")){
                self.performSegueWithIdentifier("HomeToState", sender: "")
            }
        }
    }
    
    @IBOutlet weak var UUID: UIButton!
    
    
    override func viewDidLoad() {
        request.getNowShopping(setLayout)
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setLayout(){
        mukuriImageView.image = UIImage(named: "miruki.png")
        mainButton.imageView!.image = UIImage(named: "log2.png")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

