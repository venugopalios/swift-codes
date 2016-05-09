//
//  Registration.swift
//  Assignment1
//
//  Created by Venu on 5/5/16.
//  Copyright © 2016 Venu. All rights reserved.
//

import UIKit
import CoreData

class Registration: UIViewController,UITextFieldDelegate {
    
    let backButton = UIButton()
    let submitButton = UIButton()
    let emailTextField = UITextField()
    let userTextField = UITextField()
    let passwordTextField = UITextField()
    let confirmTextField = UITextField()
    var tempTextField = UITextField()
    
    let progressView = UIProgressView()
    let strengthLabel = UILabel()
    
    var email:String = ""
    var user:String = ""
    var password = ""
    
    var emailValid:Bool = false
    var userValid:Bool = false
    var passwordValid:Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.setTitle("Back", forState: .Normal)
        backButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        backButton.titleLabel?.font = UIFont.systemFontOfSize(14)
        backButton.frame = CGRectMake(10, 20, 40, 20)
        backButton.addTarget(self, action: #selector(Registration.backAction(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(backButton)
        
        let myfirstLabel = UILabel()
        myfirstLabel.frame = CGRectMake(80, 40, 250, 40)
        myfirstLabel.text = "Please register yourself..."
        myfirstLabel.font = UIFont.boldSystemFontOfSize(15.5)
        self.view.addSubview(myfirstLabel)
        
        emailTextField.borderStyle = UITextBorderStyle.RoundedRect
        emailTextField.placeholder = "Enter your email address"
//        emailTextField.text = "abc@def.com"
        emailTextField.frame = CGRectMake(50, 90, 250, 30)
        emailTextField.delegate = self
        self.view.addSubview(emailTextField)
        
        userTextField.borderStyle = UITextBorderStyle.RoundedRect
        userTextField.placeholder = "Enter your preffered userid"
//        userTextField.text = "madmaxuser"
        userTextField.frame = CGRectMake(50, 130, 250, 30)
        userTextField.delegate = self
        self.view.addSubview(userTextField)
        
        passwordTextField.borderStyle = UITextBorderStyle.RoundedRect
        passwordTextField.placeholder = "Abcd123$"
//        passwordTextField.text = "Abcd123$"
        passwordTextField.frame = CGRectMake(50, 170, 250, 30)
        passwordTextField.secureTextEntry = true
        passwordTextField.delegate = self
        self.view.addSubview(passwordTextField)
        
        progressView.progressViewStyle = .Default
        progressView.frame = CGRectMake(50, 210, 170, 20)
        self.view.addSubview(progressView)
        
        strengthLabel.frame = CGRectMake(230, 200, 50, 20)
        strengthLabel.font = UIFont.systemFontOfSize(12.0)
        self.view.addSubview(strengthLabel)
        
        confirmTextField.borderStyle = UITextBorderStyle.RoundedRect
        confirmTextField.placeholder = "Abcd123$"
        confirmTextField.frame = CGRectMake(50, 230, 250, 30)
        confirmTextField.secureTextEntry = true
        confirmTextField.delegate = self
        self.view.addSubview(confirmTextField)
        
        submitButton.setTitle("Submit", forState: .Normal)
        submitButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        submitButton.titleLabel?.font = UIFont.systemFontOfSize(16)
        submitButton.frame = CGRectMake(150, 270, 60, 30)
        submitButton.addTarget(self, action: #selector(Registration.submitAction(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(submitButton)

    }
    
    func backAction(sender: UIButton!)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func submitAction (sender: UIButton!)
    {
        tempTextField.resignFirstResponder()
        
        if emailValid && userValid && passwordValid
        {
//            print("Registering with your details...")
            self.saveDataToDB()
        }
        else
        {
            let alert = UIAlertController(title: "", message: "Please enter valid details. All fields are mandatory.", preferredStyle: UIAlertControllerStyle.Alert)
            let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        tempTextField = textField
//        if textField == passwordTextField
//        {
//            let alert = UIAlertController(title: "", message: "Password field should be minimum 8 fields long and should have 1 special character & 1 number", preferredStyle: UIAlertControllerStyle.Alert)
//            let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
//            alert.addAction(action)
//            self.presentViewController(alert, animated: true, completion: nil)
//        }
//        if textField == confirmTextField
//        {
//            let alert = UIAlertController(title: "", message: "Confirm password must match with the password entered above", preferredStyle: UIAlertControllerStyle.Alert)
//            let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
//            alert.addAction(action)
//            self.presentViewController(alert, animated: true, completion: nil)
//        }
        textField.becomeFirstResponder()
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        textField.resignFirstResponder()
        
        var message:String = ""
        var showAlert:Bool = false
        
        if textField == emailTextField
        {
            let regExp = "^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+$"
            let stringToMatch = textField.text
            
            if let _ = stringToMatch?.rangeOfString(regExp, options: .RegularExpressionSearch)
            {
                showAlert = false
                emailValid = true
                email = emailTextField.text!
            }
            else
            {
//                print("its not Matching")
                message = "Please enter a valid email address."
                showAlert = true
                emailValid = false
            }
        }
        else if textField == userTextField
        {
            let regExp = "^(?=.*[A-z])(?=.*[^0-9]).{1,}$"
            
            let stringToMatch = textField.text
            
            if let _ = stringToMatch?.rangeOfString(regExp, options: .RegularExpressionSearch)
            {
                showAlert = false
                userValid = true
                user = userTextField.text!
            }
            else
            {
//                print("its not Matching")
                message = "Username field should not empty and should not contain numbers or special characters."
                showAlert = true
                userValid = false
            }
        }
        else if textField == passwordTextField
        {
            let regExp = "^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$&*]).{8,}$"
            
            let stringToMatch = textField.text
            
            if let _ = stringToMatch?.rangeOfString(regExp, options: .RegularExpressionSearch)
            {
                showAlert = false
                password = passwordTextField.text!
            }
            else
            {
//                print("its not Matching")
                message = "Password field should be minimum 8 fields long and should have 1 special character & 1 number."
                showAlert = true
                passwordValid = false
            }
        }
        else if textField == confirmTextField
        {
            print(confirmTextField.text)
            if textField.text == passwordTextField.text
            {
                passwordValid = true
                showAlert = false
            }
            else
            {
//                print("its not Matching")
                message = "Password and Confirm password should be same."
                showAlert = true
                passwordValid = false
            }
        }
        
        if showAlert
        {
            let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertControllerStyle.Alert)
            let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
            showAlert = false
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let result = true
        
        //Code for strength of the password
        if textField == passwordTextField
        {
            let passwordCheck = passwordTextField.text
            
//            print("Count of password \(passwordCheck?.characters.count)")
            
            if passwordCheck?.characters.count == 0
            {
                progressView.progress = 0.0
                strengthLabel.text = ""
            }
            else{
                
                let regExp = "^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$&*]).{8,}$"
                
                let passwordCheck = passwordTextField.text
                
                if passwordCheck?.characters.count < 4
                {
                    progressView.progressTintColor = UIColor.redColor()
                    strengthLabel.text = "weak"
                    strengthLabel.textColor = UIColor.redColor()
                }
                else if passwordCheck?.characters.count > 4 && passwordCheck?.characters.count < 7
                {
                    progressView.progressTintColor = UIColor.orangeColor()
                    strengthLabel.text = "medium"
                    strengthLabel.textColor = UIColor.orangeColor()
                }
                else if passwordCheck?.characters.count > 7
                {
                    if let _ = passwordCheck?.rangeOfString(regExp, options: .RegularExpressionSearch)
                    {
                        progressView.progressTintColor = UIColor.greenColor()
                        strengthLabel.text = "strong"
                        strengthLabel.textColor = UIColor.greenColor()
                    }
                    else
                    {
                        strengthLabel.text = "medium"
                        strengthLabel.textColor = UIColor.orangeColor()
                        progressView.progressTintColor = UIColor.orangeColor()
                    }
                    
                }
                
                progressView.progress = Float((passwordCheck?.characters.count)!)/9.0
            }
        
        }
        
        return result
        
    }
    
    
    
    
    func saveDataToDB()
    {
        // Password encryption
        let plainData = (password as NSString).dataUsingEncoding(NSUTF8StringEncoding)
        let base64String = plainData!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
//        print(base64String)
        
//        // Password decryption
//        let decodedData = NSData(base64EncodedString: base64String, options:NSDataBase64DecodingOptions(rawValue: 0))
//        let decodedString = NSString(data: decodedData!, encoding: NSUTF8StringEncoding)
//        print(decodedString)

        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("Registration", inManagedObjectContext: managedContext)
        let register = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        register.setValue(user, forKey: "userid")
        register.setValue(base64String, forKey: "password")
        
        do{
            try managedContext.save()
            
            self.moveToHomeScreen()
            
        }catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func moveToHomeScreen()
    {
        let homeScreen = self.storyboard?.instantiateViewControllerWithIdentifier("HomeScreen")
        let navController = UINavigationController(rootViewController: homeScreen!)
        self.presentViewController(navController, animated: true, completion: nil)
    }
}

/*  For fetching data from coredata
let appDelegate =
UIApplication.sharedApplication().delegate as! AppDelegate

let managedContext = appDelegate.managedObjectContext

//2
let fetchRequest = NSFetchRequest(entityName: "Registration")

//3
do {
let results = try managedContext.executeFetchRequest(fetchRequest)
people = results as! [NSManagedObject]

} catch let error as NSError {
print("Could not fetch \(error), \(error.userInfo)")
}

let userData = people[0]
print("userid: \(userData.valueForKey("userid")) and password: \(userData.valueForKey("password"))")
*/
