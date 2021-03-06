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
        feedback = 0;
        color = [UIColor redColor];
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
    
    
    //background circle
    [color setFill];
    CGRect rectangle = CGRectMake(0, 0, width, height);
    CGContextAddEllipseInRect(context, rectangle);
    CGContextFillPath(context);
    
    CGContextRestoreGState(context);
    
    if (feedback>percent) {
        [self drawSlice:feedback :[UIColor purpleColor]];
        [self drawSlice:percent :[UIColor blueColor]];
    }else{
        [self drawSlice:percent :[UIColor blueColor]];
        [self drawSlice:feedback :[UIColor purpleColor]];
    }
}



// helper code for drawing the "slices"
-(void) drawSlice: (float) thePerc : (UIColor *) sColor
{
    //get and save context
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    int width = self.bounds.size.width;
    int height = self.bounds.size.height;
    
    //create and fill a slice
    [sColor setFill];
    double amtToFill = M_PI*2*.010*thePerc;
    double startAngleAtTop = -M_PI_2;
    double endAngle = amtToFill + startAngleAtTop;
    CGContextMoveToPoint(context,width/2.0,height/2.0);
    CGContextAddArc(context, width/2.0, height/2.0, height/2.0, startAngleAtTop, endAngle, false);
    CGContextMoveToPoint(context,width/2.0,height/2.0);
    CGContextFillPath(context);
    
}




-(void) update: (float) per
{
    percent = per;
    [self setNeedsDisplay];
    
}

// changes the background color (the "red" circle)
-(void) setColor:(UIColor *)newColor
{
    color = newColor;
}




// sets the feedback data member
-(void) setFeedback:(float)newFeedback
{
    feedback=newFeedback;
    //NSLog(@"%f", feedback);
}

@end
