//
//  CCRCircleView.m
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 5/22/13.
//  Copyright (c) 2013 HMC Games Team. All rights reserved.
//

#import "CCRCircleView.h"

@implementation CCRCircleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        percent = 0;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
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
    
    UIColor* red = [UIColor redColor];
    [red setFill];
    
    CGRect rectangle = CGRectMake(0, 0, width, height);
    
    CGContextAddEllipseInRect(context, rectangle);
    
    
    CGContextFillPath(context);
    
    CGContextRestoreGState(context);
    
    
    UIColor* blue = [UIColor blueColor];
    [blue setFill];

    double amtToFill = M_PI*2*.010*percent;
    double startAngleAtTop = -M_PI_2;
    double endAngle = amtToFill + startAngleAtTop;
    
    //CGContextMoveToPoint(context,width/2.0,height/2.0);
    //CGContextMoveToPoint(context, width/2.0, 0);
    CGContextMoveToPoint(context,width/2.0,height/2.0);
    CGContextAddArc(context, width/2.0, height/2.0, height/2.0, startAngleAtTop, endAngle, false);
    CGContextMoveToPoint(context,width/2.0,height/2.0);
    //CGContextRotateCTM(context, 90);
    CGContextFillPath(context);
    
    //CGContextRestoreGState(context);
    
}



-(void) update: (float) per
{
    percent = per;
    [self setNeedsDisplay];
    
}

@end
