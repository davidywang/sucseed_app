//
//  GoalViewController.swift
//  Sucseed
//
//  Created by David Wang on 1/9/16.
//  Copyright © 2016 David Wang. All rights reserved.
//

import UIKit

class GoalViewController: UIViewController {
    @IBOutlet weak var goalName1: UILabel!
    @IBOutlet weak var goalType1: UILabel!
    @IBOutlet weak var goalTarget1: UILabel!
    
    var goals: [Goal] = [Goal]()
    var names: [NSString] = [NSString]()
    var types: [NSString] = [NSString]()
    var dates: [NSString] = [NSString]()
    var stages: [Int] = [Int]()
    
    var currentStage: Int = 0
    
    var imageString: NSString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if names.count > 0 {
            UserDefaults.standard.set(names, forKey: "theNames")
            let namesArr = UserDefaults.standard.object(forKey: "theNames")! as! NSArray
            
            UserDefaults.standard.set(types, forKey: "theTypes")
            let typesArr = UserDefaults.standard.object(forKey: "theTypes")! as! NSArray
            
            UserDefaults.standard.set(dates, forKey: "theDates")
            let datesArr = UserDefaults.standard.object(forKey: "theDates")! as! NSArray

            goalName1.text = namesArr[0] as? String
            goalType1.text = typesArr[0] as? String
            goalTarget1.text = datesArr[0] as! String

            stages.append(0)
            imageString = "Stage\(stages.count as Int).png" as NSString
            let imageView = UIImageView(frame: CGRect(x: 250, y: 105, width: 50, height: 50))
            let image = UIImage(named: imageString as String)
            imageView.image = image
            self.view.addSubview(imageView)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGoal" {
            let IndividualPlantViewController = segue.destination as! IndividualGoalViewController
    
            IndividualPlantViewController.name = goalName1.text!
            IndividualPlantViewController.type = goalType1.text!
            IndividualPlantViewController.date = goalTarget1.text!

            let imageView = UIImageView(frame: CGRect(x: 250, y: 105, width: 50, height: 50))
            let image = UIImage(named: "Stage\(stages.count as Int).png" as String)
            imageView.image = image
            IndividualPlantViewController.view.addSubview(imageView)
        }
    }
}

