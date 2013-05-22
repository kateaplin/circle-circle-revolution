//
//  Circle.m
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 5/22/13.
//  Copyright (c) 2013 HMC Games Team. All rights reserved.
//

#import "Circle.h"

@implementation Circle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) update:(int) percent
{
     
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    int width = self.bounds.size.width;
    int height = self.bounds.size.height;
    
    UIColor* yellow = [UIColor yellowColor];
    [yellow setFill];
    
    CGContextMoveToPoint(context, width/2.0,0);
    CGContextAddLineToPoint(context,0,height);
    CGContextAddLineToPoint(context, width, height/3.0);
    CGContextAddLineToPoint(context, 0, height/3.0);
    CGContextAddLineToPoint(context, width, height);
    CGContextAddLineToPoint(context, width/2.0, 0);
    
    CGContextFillPath(context);
    
    CGContextRestoreGState(context);
}


@end
