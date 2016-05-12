//
//  PopOverViewController.h
//  Unilever
//
//  Created by macbook on 15/05/14.
//  Copyright (c) 2014 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopOverViewController : UIViewController<UIGestureRecognizerDelegate>
{
    UIImageView *selectionImage;
    
    NSString *paramMark;
}

@property (nonatomic, retain) NSString *paramMark;

@end
