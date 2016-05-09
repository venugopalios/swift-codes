//
//  HomeScreen.swift
//  Assignment1
//
//  Created by Venu on 5/5/16.
//  Copyright © 2016 Venu. All rights reserved.
//

import UIKit
import CoreData

class HomeScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var carsInfo = UITableView()
    var resultDict = NSDictionary()
    var tableData = [AnyObject]()
    
    var indicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "List Of Cars"
        
        self.indicator = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        self.indicator.frame = CGRectMake(50, 50, 50, 50)
        self.indicator.center = self.view.center;
        self.indicator.stopAnimating()
        self.indicator.startAnimating()
        self.view.addSubview(self.indicator)
        
        self.carsInfo.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.carsInfo.frame = CGRectMake(0, 70, self.view.frame.width, (self.view.frame.height)-70)
        self.carsInfo.hidden = true
        self.carsInfo.delegate = self
        self.carsInfo.dataSource = self
        self.view.addSubview(self.carsInfo)
        
        
        
        if Reachability.isConnectedToNetwork() == true {
            
            self.urlConnection()
            
            print("Internet connection OK")
        } else {
            print("Internet connection FAILED")
            
            let appDelegate =
                UIApplication.sharedApplication().delegate as! AppDelegate
            
            let managedContext = appDelegate.managedObjectContext
            
            let fetchRequest = NSFetchRequest()
            
            // Create Entity Description
            let entityDescription = NSEntityDescription.entityForName("Listofcars", inManagedObjectContext: managedContext)
            
            // Configure Fetch Request
            fetchRequest.entity = entityDescription
            
            do {
                let result = try managedContext.executeFetchRequest(fetchRequest)
                
                if (result.count > 0) {
                    let person = result[0] as! NSManagedObject
                    
                    if let first = person.valueForKey("niceName") {
                    
                        let dataStr = self.convertStringToDictionary(first as! String)! as NSDictionary
                        
                        self.tableData = self.getCarsList(dataStr) as [AnyObject]
                        
                        self.carsInfo.reloadData()
                        self.carsInfo.hidden = false
                        
                        self.indicator.stopAnimating()
                        self.indicator.hidden = true
                        
                    }
                }
                
            } catch {
                let fetchError = error as NSError
                print(fetchError)
            }
        }

        
    }
    
    func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.dataUsingEncoding(NSUTF8StringEncoding) {
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? [String:AnyObject]
                return json
            } catch {
                print("Something went wrong")
            }
        }
        return nil
    }
    
//MARK : UITableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        if (cell == nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle,
                reuseIdentifier: "Cell")
        }
        
        let carDetails = tableData[indexPath.row] as! NSDictionary
        cell.textLabel?.text = carDetails.valueForKey("name") as? String
        cell.detailTextLabel?.text = carDetails.valueForKey("years")![0].valueForKey("year") as? String
        cell.imageView?.image = UIImage(named: "info-icon.png")
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.selectionStyle = UITableViewCellSelectionStyle.Default
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let carDetailsView = self.storyboard!.instantiateViewControllerWithIdentifier("DetailsView") as! CarDetailsViewController
        carDetailsView.details = self.tableData[indexPath.row] as! NSDictionary
        
        self.navigationController?.pushViewController(carDetailsView, animated: true)
    }
    
    func urlConnection()
    {
        let url = NSURL(string: "https://api.edmunds.com/api/vehicle/v2/makes?state=used&year=2014&view=basic&fmt=json&api_key=qbfh56bqes9r22b55dx492ng")
        
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            do{
                try self.resultDict = NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSDictionary
                self.tableData = self.getCarsList(self.resultDict) as [AnyObject]
                print("All Cars: \(self.tableData)")
                
                
                //Saving value to core data
                
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                let managedContext = appDelegate.managedObjectContext
                
                let dataString = String(data: data!, encoding: NSUTF8StringEncoding)

                
                let entity = NSEntityDescription.entityForName("Listofcars", inManagedObjectContext: managedContext)
                let listOfCars = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
                listOfCars.setValue(dataString, forKey: "niceName")
                
                
                do{
                    try managedContext.save()
                    
                }catch let error as NSError {
                    print("Could not save \(error), \(error.userInfo)")
                }
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.carsInfo.reloadData()
                    self.carsInfo.hidden = false
                    
                    self.indicator.stopAnimating()
                    self.indicator.hidden = true
                })
            }
            catch let error as NSError
            {
                print(error)
            }
        }
        task.resume()
        
        
        /*let request = NSURLRequest(URL: url!)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
            print(NSString(data: data!, encoding: NSUTF8StringEncoding))
        }*/
    }

    func getCarsList(dictionary:NSDictionary) -> NSArray
    {
        var carsList = [AnyObject]()
        
        let makes = dictionary.valueForKey("makes") as! NSArray
        for makesCount in 0..<makes.count
        {
            let models = makes[makesCount].valueForKey("models") as! NSArray
            for model in 0..<models.count
            {
                carsList.append(models[model])
            }
        }
        return carsList
    }
    
//    func createTable()
//    {
//    }
}