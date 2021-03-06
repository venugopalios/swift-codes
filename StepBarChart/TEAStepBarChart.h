//
//  TEAStepBarChart.h
//  StepBarChart
//
//  Created by Macbook on 17/03/15.
//  Copyright (c) 2015 AnalyticsQuotient. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TEAStepBarChart : UIView

// Array of NSNumber
@property (nonatomic) NSArray *data;

//Array of Significance Values
@property (nonatomic) NSArray *sigData;

// Max y value for chart (only works when autoMax is NO)
@property (nonatomic) CGFloat max;

// Auto set max value
@property (nonatomic) BOOL autoMax;

@property (nonatomic) UIColor *barColor;
@property (nonatomic) NSInteger barSpacing;
@property (nonatomic) UIColor *backgroundColor;

// Round bar height to pixel for sharper chart
@property (nonatomic) BOOL roundToPixel;

@end
