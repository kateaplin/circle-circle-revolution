//
//  CCRViewController.h
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 5/22/13.
//  Copyright (c) 2013 HMC Games Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "CCRCircleView.h"

@interface CCRViewController : UIViewController
{
    float circlePercent;
    CGRect circleFrame;
    NSArray* currentFraction;
    UILabel* fractionLabel;
    UILabel* scoreLabel;
    CCRCircleView* currentCircle;
    NSTimer* timer;
    Model* model;
    int score;
}

-(void) startTimer;
-(void) updateCircle;
-(void) newObject;
-(CCRCircleView*) newCircle;
-(void) scoreTap;
-(void) touchesBegan:(NSSet*) touches withEvent:(UIEvent*) event;




@end
