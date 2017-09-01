//
//  IndividualGoalViewController.swift
//  Sucseed
//
//  Created by David Wang on 1/10/16.
//  Copyright © 2016 David Wang. All rights reserved.
//

import UIKit

class IndividualGoalViewController: UIViewController {
    @IBOutlet weak var goalName: UILabel!
    @IBOutlet weak var goalType: UILabel!
    @IBOutlet weak var goalDate: UILabel!
    
    var name: String = ""
    var type: String = ""
    var date: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        goalName.text = name
        goalType.text = type
        goalDate.text = date
        
        //NSUserDefaults.standardUserDefaults().setObject(timesOfSubmit, forKey: "theSubmitTimes")
        //let submitTimes = NSUserDefaults.standardUserDefaults().objectForKey("theSubmitTimes")! as! Int
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backToGoals" {
            let plantViewController = segue.destination as! GoalViewController
            
            plantViewController.names.append(goalName.text! as NSString)
            plantViewController.types.append(goalType.text! as NSString)
            plantViewController.dates.append(goalDate.text! as NSString)
            
            plantViewController.stages.append(0)
            
            let imageView = UIImageView(frame: CGRect(x: 250, y: 105, width: 50, height: 50))
            let image = UIImage(named: "Stage\((plantViewController.stages.count + 1) as Int).png")
            imageView.image = image
            plantViewController.view.addSubview(imageView)
        }
    }
}
