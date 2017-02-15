//
//  RecordView.swift
//  Newprototype
//
//  Created by kit305 on 23/04/2016.
//  Copyright © 2016 kit305. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {
    
    
    
    var selecteditem: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "returntoprogress"){
            
            let returnpage = segue.destinationViewController as! UITabBarController
            returnpage.selectedIndex = 0
            
        }
    }

    
    
    
    
    /*
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return food.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = self.rtableview.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! RecordTableViewCell
        
        cell.title.text = food[indexPath.row]
        
        return cell
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return "Hello"
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    */
        
}
