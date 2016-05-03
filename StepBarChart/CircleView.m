//
//  CircleView.m
//  StepBarChart
//
//  Created by Macbook Pro on 20/08/14.
//  Copyright (c) 2014 AnalyticsQuotient. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView


- (void)drawRect:(CGRect)rect
{
    
//    CGRect rectVal = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width+100, rect.size.height+100);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // Set the border width
    CGContextSetLineWidth(ctx, 1.0);
    CGContextSetRGBStrokeColor(ctx, 159.0/255.0f, 158.0/255.0f, 158.0/255.0f, 1.0);
    
    CGContextAddEllipseInRect(ctx, rect);
    CGContextSetFillColor(ctx, CGColorGetComponents([[UIColor yellowColor] CGColor]));
    CGContextFillPath(ctx);
    CGContextStrokeEllipseInRect(ctx, rect);
    
    
    UILabel *lblRef = [[UILabel alloc] initWithFrame:CGRectMake(rect.size.width/2-20, rect.size.width/2-10, 45, 15)];
    lblRef.text = [NSString stringWithFormat:@"%.f%%",rect.size.width];
    lblRef.font = [UIFont systemFontOfSize:15];
    lblRef.textColor = [UIColor blackColor];
    [lblRef setTextAlignment:NSTextAlignmentCenter];
    lblRef.backgroundColor = [UIColor clearColor];
    [self addSubview:lblRef];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
