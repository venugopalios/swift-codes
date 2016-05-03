//
//  ViewController.m
//  StepBarChart
//
//  Created by Macbook Pro on 19/08/14.
//  Copyright (c) 2014 AnalyticsQuotient. All rights reserved.
//

#import "ViewController.h"

#import "TEAChart.h"

#import "CircleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Draw circle with uiview
    CGRect positionFrame = CGRectMake(30,40,100,100);
    CircleView * circleView = [[CircleView alloc] initWithFrame:positionFrame];
    circleView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:circleView];
    
    
    
    //Circle with label
//    CGFloat r = 50;
//    
//    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(10,50,1.5*r,1.5*r)];
//    lbl.text = @"●";
//    lbl.backgroundColor = [UIColor clearColor];
//    lbl.textColor = [UIColor redColor];
//    lbl.font = [UIFont systemFontOfSize:2*r];
//    lbl.alpha = 0.5;
//    [self.view addSubview:lbl];
    
    
    //Using CAShape layer
//    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//    CGPoint locationPoint = CGPointMake(120, 150);
//    
//    shapeLayer.path = [[self makeCircleAtLocation:locationPoint radius:80.0] CGPath];
//    shapeLayer.strokeColor = [[UIColor grayColor] CGColor];
//    shapeLayer.fillColor = [[UIColor yellowColor] CGColor];
//    shapeLayer.lineWidth = 1.0;
//    
//    
//    CATextLayer *label = [[CATextLayer alloc] init];
//    [label setFontSize:15];
//    [label setFrame:CGRectMake(locationPoint.x-20, locationPoint.y-10, 45, 15)];
//    [label setString:@"80%"];
//    [label setAlignmentMode:kCAAlignmentCenter];
//    [label setForegroundColor:[[UIColor blackColor] CGColor]];
//    [shapeLayer addSublayer:label];
//    
//    
//    // Add CAShapeLayer to our view
//    [self.view.layer addSublayer:shapeLayer];

    
    TEABarChart *stepChart = [[TEABarChart alloc] initWithFrame:CGRectMake(20, 180, 220, 10)];
    stepChart.barColor = [UIColor redColor];
    stepChart.data = @[@80];
    [self.view addSubview:stepChart];
    
    TEABarChart *stepChart1 = [[TEABarChart alloc] initWithFrame:CGRectMake(20, 240, 220, 40)];
    stepChart1.data = @[@14];
    [self.view addSubview:stepChart1];
    
    TEABarChart *stepChart2 = [[TEABarChart alloc] initWithFrame:CGRectMake(20, 300, 220, 40)];
    stepChart2.data = @[@22];
    [self.view addSubview:stepChart2];
}



- (UIBezierPath *)makeCircleAtLocation:(CGPoint)location radius:(CGFloat)radius
{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:location radius:radius startAngle:0.0 endAngle:M_PI * 2.0 clockwise:YES];
    return path;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
