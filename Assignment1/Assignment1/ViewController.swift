//
//  ViewController.swift
//  Assignment1
//
//  Created by Venu on 5/5/16.
//  Copyright © 2016 Venu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let registerButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.urlConnection()
        
        registerButton.setTitle("Register User", forState: .Normal)
        registerButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        registerButton.frame = CGRectMake(150, 250, 150, 40)
        registerButton.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_2))
        registerButton.addTarget(self, action:#selector(ViewController.registerAction(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(registerButton)
    }

    func registerAction(sender: UIButton!)
    {
//        print("Register Button clicked, Moving to registration page...")
        
        let registerPage = self.storyboard!.instantiateViewControllerWithIdentifier("Registration")
        self.presentViewController(registerPage, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func urlConnection()
    {
        let url = NSURL(string: "https://api.edmunds.com/api/vehicle/v2/makes?state=used&year=2014&view=basic&fmt=json&api_key=qbfh56bqes9r22b55dx492ng")

        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            print(NSString(data: data!, encoding: NSUTF8StringEncoding))
        }
        task.resume()

//        let request = NSURLRequest(URL: url!)
//        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
//            print(NSString(data: data!, encoding: NSUTF8StringEncoding))
//        }
    }
}

