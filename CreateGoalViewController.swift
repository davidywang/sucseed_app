//
//  CreateGoalViewController.swift
//  Sucseed
//
//  Created by David Wang on 1/9/16.
//  Copyright © 2016 David Wang. All rights reserved.
//

import UIKit

class CreateGoalViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var nameOfGoal: UITextField!
    @IBOutlet weak var typeOfGoal: UIPickerView!
    @IBOutlet weak var targetDateOfGoal: UIDatePicker!
    
    let typesOfGoals = ["Personal", "Financial", "Educational", "Health", "Impossible"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ typeOfGoal: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return typesOfGoals.count
    }
    
    func pickerView(_ typeOfGoal: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return typesOfGoals[row]
    }
    
    var target: String = ""
    
    func returnDate(_ date:Date) -> String {
        let dateFormatter = DateFormatter()
        
        let theDateFormat = DateFormatter.Style.short
        //let theTimeFormat = NSDateFormatterStyle.ShortStyle
        
        dateFormatter.dateStyle = theDateFormat
        //dateFormatter.timeStyle = theTimeFormat
        
        return dateFormatter.string(from: date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.typeOfGoal.dataSource = self
        self.typeOfGoal.delegate = self
        
        self.targetDateOfGoal.datePickerMode = UIDatePickerMode.date
        let currentDate = Date()
        self.targetDateOfGoal.minimumDate? = currentDate        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addGoal" {
            let plantViewController = segue.destination as! GoalViewController
            
            let newGoal = Goal(goalName: nameOfGoal.text!, goalType: typesOfGoals[typeOfGoal.selectedRow(inComponent: 0)], goalTargetDate: returnDate(targetDateOfGoal.date))
            
            plantViewController.names.append(newGoal.name as NSString)
            plantViewController.types.append(newGoal.type as NSString)
            plantViewController.dates.append(newGoal.targetDate as NSString)
        }
    }
}
