//
//  CCRCircleView.h
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 5/22/13.
//  Copyright (c) 2013 HMC Games Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCRCircleView : UIView
{
    float percent;
    UIColor* color;
    float feedback;
}

-(void) update: (float) per;
-(void) setColor: (UIColor*) newColor;
-(void) setFeedback: (float) newFeedback;

@end
