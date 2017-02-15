//
//  feedbackViewController.swift
//  Newprototype
//
//  Created by kit305 on 15/05/2016.
//  Copyright © 2016 kit305. All rights reserved.
//

import UIKit
import CoreData

class feedbackViewController: UIViewController {
    
    @IBOutlet var cat1intake: UILabel!
    @IBOutlet var cat2intake: UILabel!
    @IBOutlet var cat3intake: UILabel!
    @IBOutlet var cat4intake: UILabel!
    @IBOutlet var cat5intake: UILabel!
    @IBOutlet var cat1default: UILabel!
    @IBOutlet var cat2default: UILabel!
    @IBOutlet var cat3default: UILabel!
    @IBOutlet var cat4default: UILabel!
    @IBOutlet var cat5default: UILabel!
    @IBOutlet var adviceString: UILabel!
    
    var objects = [NSManagedObject]()
    var formattedtime = String()
    var formatteddate = NSDate()
    let date = NSDate()
    let cat1 = Category1()
    let cat2 = Category2()
    let cat3 = Category3()
    let cat4 = Category4()
    let cat5 = Category5()
    var cat1count:Int = 0
    var cat2count:Int = 0
    var cat3count:Int = 0
    var cat4count:Int = 0
    var cat5count:Int = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func timeformat(){
        let format = NSDateFormatter()
        format.dateStyle = NSDateFormatterStyle.ShortStyle
        let time = format.stringFromDate(date)
        self.formattedtime = time
        self.formatteddate = format.dateFromString(time)!
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "FOOD")
        timeformat()
        fetchRequest.predicate = NSPredicate(format: "time = %@", formatteddate)
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            //timeformat()
            
            objects = results as! [NSManagedObject]
            
        }
        catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        count()
        cat1intake.text = String(cat1count)
        cat2intake.text = String(cat2count)
        cat3intake.text = String(cat3count)
        cat4intake.text = String(cat4count)
        cat5intake.text = String(cat5count)
        cat1default.text = String(2)
        cat2default.text = String(4)
        cat3default.text = String(3)
        cat4default.text = String(3)
        cat5default.text = String(3)
        advice()
    }
    
    override func viewDidDisappear(animated: Bool) {
        cat1count = 0
        cat2count = 0
        cat3count = 0
        cat4count = 0
        cat5count = 0
    }
    
    func count(){
        for e in objects{
            
            let cat1name = [String](cat1.objects.keys)
            let cat2name = [String](cat2.objects.keys)
            let cat3name = [String](cat3.objects.keys)
            let cat4name = [String](cat4.objects.keys)
            let cat5name = [String](cat5.objects.keys)
        
            if cat1name.contains((e.valueForKey("fname") as? String)!){
                self.cat1count++
            }
            else if cat2name.contains((e.valueForKey("fname") as? String)!){
                self.cat2count++
            }
            else if cat3name.contains((e.valueForKey("fname") as? String)!){
                self.cat3count++
            }
            else if cat4name.contains((e.valueForKey("fname") as? String)!){
                self.cat4count++
            }
            else if cat5name.contains((e.valueForKey("fname") as? String)!){
                self.cat5count++
            }
            else {
                print("Every item has been count")
            }
        }
    }
    
    func advice(){
        if cat1count > 2 {
            adviceString.text = "Too much fruit"
        }
        else if cat1count < 2 {
            adviceString.text = "Try get some fruit"
        }
        else if cat1count == 2 {
            adviceString.text = "Perfect"
        }
        if cat2count > 4 {
            adviceString.text?.appendContentsOf("\n Too much vegetable")
        }
        else if cat2count < 4 {
            adviceString.text?.appendContentsOf("\n Try get some vegetable")
        }
        else if cat2count == 4 {
            adviceString.text?.appendContentsOf("\n Perfect")
        }
        if cat3count > 3 {
            adviceString.text?.appendContentsOf("\n Too much Grain")
        }
        else if cat3count < 3 {
            adviceString.text?.appendContentsOf("\n Try get some grain")
        }
        else if cat3count == 3 {
            adviceString.text?.appendContentsOf("\n Perfect")
        }
        if cat4count > 3 {
            adviceString.text?.appendContentsOf("\n Too much meats&nuts")
        }
        else if cat4count < 3 {
            adviceString.text?.appendContentsOf("\n Try get some meats&nuts")
        }
        else if cat4count == 3 {
            adviceString.text?.appendContentsOf("\n Perfect")
        }
        if cat5count > 3 {
            adviceString.text?.appendContentsOf("\n Too much milk&yogurt")
        }
        else if cat5count < 3 {
            adviceString.text?.appendContentsOf("\n Try get some milk&yogurt")
        }
        else if cat5count == 3 {
            adviceString.text?.appendContentsOf("\n Perfect")
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
