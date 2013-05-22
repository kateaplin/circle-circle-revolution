//
//  CCRViewController.h
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 5/22/13.
//  Copyright (c) 2013 HMC Games Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Circle.h"
#import "Model.h"

@interface CCRViewController : UIViewController
{
    int circlePercent;
    CGRect circleFrame;
    NSArray* currentFraction;
    Circle* currentCircle;
    NSTimer* timer;
    Model* model;
    int score;
}

-(void) startTimer;
-(void) updateCircle;
-(void) newObject;
-(Circle*) newCircle;
-(void) scoreTap;
-(void) touchesBegan:(NSSet*) touches withEvent:(UIEvent*) event;




@end
