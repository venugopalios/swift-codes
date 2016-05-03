//
//  TEABarChart.m
//  Xhacker
//
//  Created by Xhacker on 2013-07-25.
//  Copyright (c) 2013 Xhacker. All rights reserved.
//

#import "TEABarChart.h"

@implementation TEABarChart

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadDefaults];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if (self) {
        [self loadDefaults];
    }
    return self;
}

- (void)loadDefaults
{
    self.opaque = NO;
    
    _autoMax = YES;
    _barColor = [UIColor colorWithRed:106.0/255 green:175.0/255 blue:232.0/255 alpha:1];
    _barSpacing = 8;
    
    _backgroundColor = [UIColor colorWithWhite:0.97 alpha:1];
//    _backgroundColor = [UIColor colorWithWhite:0.97 alpha:1];
    _roundToPixel = YES;
}

- (void)drawRect:(CGRect)rect
{    
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
 
    //Customized predefined statement
//    double max = self.autoMax ? [[self.data valueForKeyPath:@"@max.self"] doubleValue] : self.max;
    
    //Maximum value by default is 100 so it will show the values based on 100
    double max = self.autoMax ? 100 : self.max; //Change value 120 if size is more
    CGFloat barMaxHeight = CGRectGetWidth(rect);
    
    NSInteger numberOfBars = self.data.count;
    CGFloat barWidth = (CGRectGetWidth(rect) - self.barSpacing * (numberOfBars - 1)) / numberOfBars;
    CGFloat barWidthRounded = ceil(barWidth);
    
    for (NSInteger i = 0; i < numberOfBars; i += 1)
    {
        CGFloat barHeight = barMaxHeight * [self.data[i] floatValue] / max;
        if (barHeight > barMaxHeight) {
            barHeight = barMaxHeight;
        }
        if (self.roundToPixel) {
            barHeight = (int)barHeight;
        }
        
        CGFloat x = floor(i * (barWidth + self.barSpacing));
        
        [self.backgroundColor setFill];
        CGRect backgroundRect = CGRectMake(0, x, barMaxHeight, barWidthRounded);
        CGContextFillRect(context, backgroundRect);
        
        
        int unitDigit = [[self.data valueForKeyPath:@"@max.self"] intValue]%10;
        int firstDigit = ([[self.data valueForKeyPath:@"@max.self"] intValue] - unitDigit)/10;
        
        
        NSMutableArray *chartVal = [[NSMutableArray alloc] init];
        
        for (int i=0; i<firstDigit; i++) {
            
            [chartVal addObject:[NSNumber numberWithFloat:20]]; //Change value to double if the width is more than 120
            
        }
        
        if (firstDigit != 10) {
            
            [chartVal addObject:[NSNumber numberWithInt:unitDigit+10]];//Add last two dgits of width (like 20 if it's width is 220)
        }

//        NSLog(@"chartVal %@",chartVal);
        
        for (int j=0; j<[chartVal count]; j++) {
            
            if (j == 0) {
                
                [self.barColor setFill];
                CGRect barRect = CGRectMake(0, x,[(NSNumber *)[chartVal objectAtIndex:j] floatValue],barWidthRounded);
                CGContextFillRect(context, barRect);
                
            }
            else
            {
                [self.barColor setFill];
                CGRect barRect = CGRectMake(j*22, x,[(NSNumber *)[chartVal objectAtIndex:j] floatValue],barWidthRounded);//Change the value of 12 if value is more than 120
                CGContextFillRect(context, barRect);
                
//                NSLog(@"%@",NSStringFromCGRect(barRect));
            }
        }
    }

}

#pragma mark Setters

- (void)setData:(NSArray *)data
{
    _data = data;
    _sigData = data;
    [self setNeedsDisplay];
}

- (void)setMax:(CGFloat)max
{
    _max = max;
    [self setNeedsDisplay];
}

- (void)setAutoMax:(BOOL)autoMax
{
    _autoMax = autoMax;
    [self setNeedsDisplay];
}

- (void)setBarColor:(UIColor *)barColor
{
    _barColor = barColor;
    [self setNeedsDisplay];
}

- (void)setBarSpacing:(NSInteger)barSpacing
{
    _barSpacing = barSpacing;
    [self setNeedsDisplay];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    _backgroundColor = backgroundColor;
    [self setNeedsDisplay];
}

@end
