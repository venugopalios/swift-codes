//
//  ViewController.h
//  InterFaceOrientationWithStoryboard
//
//  Created by macbook on 15/05/14.
//  Copyright (c) 2014 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PopOverViewController.h"

@interface ViewController : UIViewController
{
    UIButton *popButton;
    
    UIView *topBarView;
}

@property (nonatomic, retain) UIPopoverController *popOver;

@end
