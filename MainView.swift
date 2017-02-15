//
//  MainView.swift
//  Newprototype
//
//  Created by kit305 on 28/04/2016.
//  Copyright © 2016 kit305. All rights reserved.
//

import UIKit

class MainView: UITabBarController {
    
    var superobjects = [String]()
    var receivedarray = [String]()
    
    let todaysmeal = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func grabtodaysmeal() {
        
        let grabtodaymeal = todaysmeal.objectForKey("meal")
        
        
        print("current object list is ",grabtodaymeal)
    }
    
    func settodaysmeal() {
        todaysmeal.setObject(superobjects, forKey: "meal")
        todaysmeal.synchronize()
    }
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        if selectedIndex == 0 {
            
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
