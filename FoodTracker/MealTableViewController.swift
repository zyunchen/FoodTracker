//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by zhangyunchen on 16/4/1.
//  Copyright © 2016年 zhangyunchen. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    //MARK: Properties
    var meals = [Meal]()

    override func viewDidLoad() {
        super.viewDidLoad()

        //Load the sample data.
        loadSampleMeals()
    }
    
    func loadSampleMeals(){
        let photo1 = UIImage(named: "avator")!
        let meal1 = Meal(name: "avator", photo: photo1, rating: 4)!
        
        let photo2 = UIImage(named: "nani")!
        let meal2 = Meal(name: "nani", photo: photo2, rating: 4)!
        
        let photo3 = UIImage(named: "scene")!
        let meal3 = Meal(name: "scene", photo: photo3, rating: 4)!
        
        meals += [meal1,meal2,meal3]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //Table view cells are reused and should be dequeued using a cell identifier
        let cellIdentifier = "MealTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MealTableViewCell
        //Fetches the appropriates meal for the data source layout
        let meal = meals[indexPath.row]
        
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating

        return cell
    }
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue){
        
        if let sv = sender.sourceViewController as? MealViewController{
            print("it is meal view controller")
        }
        
        if let sourceViewController = sender.sourceViewController as? MealViewController,meal = sourceViewController.meal{
            print("it has been here")
            let newIndexPath = NSIndexPath(forRow: meals.count, inSection: 0)
            meals.append(meal)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
        }
    }

}
