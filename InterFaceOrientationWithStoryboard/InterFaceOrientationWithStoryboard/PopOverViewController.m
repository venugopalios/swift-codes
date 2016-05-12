//
//  PopOverViewController.m
//  Unilever
//
//  Created by macbook on 15/05/14.
//  Copyright (c) 2014 macbook. All rights reserved.
//

#import "PopOverViewController.h"

@interface PopOverViewController ()

@end

@implementation PopOverViewController

@synthesize paramMark;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    NSLog(@"%@",paramMark);
    
//    selectionImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 290, 730)];
//    
//    if ([paramMark isEqualToString:@"Menu"]) {
//        selectionImage.image = [UIImage imageNamed:@"menu.png"];
//    }
//    else
//    {
//        selectionImage.image = [UIImage imageNamed:@"market.png"];
//    }
//    
//    selectionImage.userInteractionEnabled = YES;
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClicked)];
//    
//    [selectionImage addGestureRecognizer:tap];
//    
//    
//    [self.view addSubview:selectionImage];
    
    
}

//-(void)tapClicked
//{
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"DismissPopover" object:nil];
//}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
