//
//  ViewController.m
//  InterFaceOrientationWithStoryboard
//
//  Created by macbook on 15/05/14.
//  Copyright (c) 2014 macbook. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    popButton = [UIButton buttonWithType:UIButtonTypeCustom];
   
    if (([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft) || ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight))
    {
        popButton.frame = CGRectMake(980, 10, 30, 30);
        
        topBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 40)];
        topBarView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"topbarlandscape.png"]];

    }
    else
    {
        //Potrait
        
        popButton.frame = CGRectMake(720, 10, 30, 30);
        
        topBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 768, 40)];
        topBarView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"topbarpotrait.png"]];

    }
    
    [popButton setTitle:@"P" forState:UIControlStateNormal];
    [popButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [popButton addTarget:self action:@selector(popClicked:) forControlEvents:UIControlEventTouchUpInside];
    [topBarView addSubview:popButton];
    
    [self.view addSubview:topBarView];
    
}

-(void)popClicked:(UIButton *)sender
{
    PopOverViewController *PopoverView =[[PopOverViewController alloc] initWithNibName:@"PopOverViewController" bundle:nil];
    
    self.popOver =[[UIPopoverController alloc] initWithContentViewController:PopoverView];
    self.popOver.popoverContentSize = CGSizeMake(290, 730);
    
    [self showPop:sender];
}

-(void)showPop:(UIButton *)sender
{
    [self.popOver presentPopoverFromRect:sender.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}


- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {

        popButton.frame = CGRectMake(980, 5, 30, 30);
        
        topBarView.frame = CGRectMake(0, 0, 1024, 40);
        
    }
    else
    {
        popButton.frame = CGRectMake(720, 5, 30, 30);
        
        topBarView.frame = CGRectMake(0, 0, 768, 40);
        
    }
    
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self showPop:popButton];
    
    if (([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft) || ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight))
    {
        topBarView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"topbarlandscape.png"]];
    }
    else
    {
        topBarView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"topbarpotrait.png"]];
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
