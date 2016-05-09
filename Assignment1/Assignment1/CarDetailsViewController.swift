//
//  CarDetailsViewController.swift
//  Assignment1
//
//  Created by Venu on 5/6/16.
//  Copyright © 2016 Venu. All rights reserved.
//

import UIKit

class CarDetailsViewController: UIViewController {
    
    @IBOutlet weak var largeImageView: UIImageView!
    
    @IBOutlet weak var carDetails: UITextView!
    
    var details = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = details.valueForKey("id") as? String
        
        self.largeImageView.image = UIImage(named: "audi.png")
        
        let detailsText = "Car name: \(details.valueForKey("id")!) \nNickname: \(details.valueForKey("niceName")!) \nYear of manufacture: \(details.valueForKey("years")![0].valueForKey("year")!)"
        self.carDetails.text = detailsText
    }
    
    
}
